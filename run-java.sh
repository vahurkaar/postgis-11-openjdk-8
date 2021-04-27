#!/bin/bash

set -e

until pg_isready -h $(hostname) -d $POSTGRES_DB -p 5432 -U $POSTGRES_USER
do
  echo "Waiting for database"
  sleep 1;
done

java -version

if [[ -e ./app.jar ]]; then
  echo "Starting Java Application..."
  java -jar ./app.jar $JAVA_OPTS
fi