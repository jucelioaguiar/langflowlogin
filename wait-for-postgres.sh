#!/bin/sh
# Script para aguardar o PostgreSQL ficar pronto

set -e

host="$1"
shift

echo "Aguardando PostgreSQL em $host:5432..."

# Loop até que o comando 'pg_isready' tenha sucesso
until pg_isready -h "$host" -p "5432" -U "${POSTGRES_USER}" -d "${POSTGRES_DB}"; do
  echo "Postgres ainda não está pronto - aguardando..."
  sleep 2
done

echo "PostgreSQL está pronto!"
