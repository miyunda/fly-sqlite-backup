#!/bin/bash
# Set the DATE variable to the current date from the runner VM, in the format YYYY-MM-DD.
DATE=$(date +%F)

# Install SQLite cli.
INSTALL_SQLITE="apt-get update && apt-get install sqlite3 -y"

# Create a backup of the SQLite database.
BACKUP_DB="sqlite3 /data/db.sqlite3 '.backup /data/db.bak'"

# Compress the backup file and append the current date to the filename.
CREATE_ARCHIVE="gzip -cv /data/db.bak > /opt/$DATE.db.bak.gz"

# Delete any archived files that are older than 30 days.
CLEAN_UP="find /opt -type f -name '*.db.bak.gz' -mtime +30 -exec rm '{}' +"

# Execute above of commands via a remote SSH console on your app.
fly ssh console -a $APP_NAME -C 'bash -c "'"$INSTALL_SQLITE"' && '"$BACKUP_DB"' && '"$CREATE_ARCHIVE"' && '"$CLEAN_UP"'"'

# Copy the created archive file to the runner machine.
fly sftp -a $APP_NAME get "/opt/$DATE.db.bak.gz"
