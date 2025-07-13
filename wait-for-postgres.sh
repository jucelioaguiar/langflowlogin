#!/bin/sh
# Em wait-for-postgres.sh

set -e

host="$1"
shift
cmd="$@"

# Loop até que o comando 'pg_isready' tenha sucesso
until pg_isready -h "$host" -p "5432" -U "${POSTGRES_USER}"; do
  >&2 echo "Postgres ainda não está pronto - aguardando"
  sleep 1
done

>&2 echo "Postgres está pronto - executando o comando principal"
exec $cmd
