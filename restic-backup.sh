#!/bin/bash

# we init the repo if it doesn't exist
restic -r "${RESTIC_REPOSITORY}" init || true

mysqldump -h "${MYSQL_HOST}" -B "${MYSQL_DATABASE}" -u "${MYSQL_USER}" --password="${MYSQL_PASSWORD}" | restic -r "${RESTIC_REPOSITORY}" backup --stdin --stdin-filename "${BACKUP_FILENAME}.sql"
