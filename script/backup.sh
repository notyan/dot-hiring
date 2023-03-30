#!/bin/bash

# Set variables for database credentials
DB_USER="dot-user"
DB_PASSWORD="d0tp455w0rd"
DB_NAME="laravel_starter"

# Set variables for backup file names and Google Cloud Storage bucket name
BACKUP_DATE=$(date +%Y-%m-%d-%H-%M-%S)
BACKUP_NAME="laravel-backup-$BACKUP_DATE"
SOURCE_CODE_BACKUP="$BACKUP_NAME.tar.gz"
DATABASE_BACKUP="$BACKUP_NAME.sql"
BUCKET_NAME="your-bucket-name"

# Create a backup directory
mkdir -p /backup

# Backup the Laravel source code to a compressed file
tar czf /backup/$SOURCE_CODE_BACKUP /var/www/dot.defaroyan.my.id/

# Backup the database to a file
mysqldump --user=$DB_USER --password=$DB_PASSWORD --databases $DB_NAME > /backup/$DATABASE_BACKUP

# Upload the backup files to Google Cloud Storage
gsutil cp /backup/$SOURCE_CODE_BACKUP gs://$BUCKET_NAME/$SOURCE_CODE_BACKUP
gsutil cp /backup/$DATABASE_BACKUP gs://$BUCKET_NAME/$DATABASE_BACKUP

# Clean up the backup directory
rm /backup/$SOURCE_CODE_BACKUP
rm /backup/$DATABASE_BACKUP

# Print a success message
echo "Backup complete and uploaded to Google Cloud Storage."