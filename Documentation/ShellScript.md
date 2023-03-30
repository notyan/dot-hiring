# Shell script beserta penjelasannya dan hasil uji script berjalan sesuai ketentuan

## Shell Script
Both shell Script are located on the script folder

### Backup Script
Backup script are using `mysqldump` for database backup and `tar` to archive the source code. Then upload both database and tar using `gsutils`. After the upload success it will delete local backup to save space

Backup process
1. Get Compute engine Service account Key via google cloud console IAM & Admin > Service Account > Keys > ADD KEY > Create New Key > Json. There will be download started, then copy the content.
2. Login into VM and run `nano /backup/key.json` and paste the downloaded key from step 1
3. Configure the variable to match the setting. Below listed the configurable variable

    - `DB_USER`      laravel database user
    - `DB_PASSWORD` Laravel database password
    - `DB_NAME`     laravel database
    - `BUCKET_NAME` Google cloud storage bucket that will be used
    - `PROJECT_ID`  Google project id 
    - `SA_KEY`      Service account key

### Monitoring Script
Monitoring Script use free and df command to get the information

#### Memory information
To get memory used and total memory data, the script run `free -h` command then using `awk` command to filter the specific data needed and assign it into specific variable

The `free` command are used to show the system memory usage 

The `-h` option are used to display the output as human-readable format

The `awk` piping are used to search for the line that started with string `Mem:` 

The `{print $2}` are used to print the second field after the `awk` find the line

#### Disk Infomation
Data needed for Disk information are achievable using `df` , to filter the data and format the data three options are used

The `-B` Option sets the block size to Megabytes and

The `-M` Option display the size in megabytes

The `--output` option allow to specify the columns needed to display in the ouput

## Hasil Ujicoba
### Backup Script
```bash
root@dot-instance:/home/royan# ./backup.sh
tar: Removing leading `/' from member names
mysqldump: [Warning] Using a password on the command line interface can be insecure.
Copying file:///backup/laravel-backup-2023-03-30-13-46-25.tar.gz [Content-Type=application/x-tar]...
\ [1 files][ 73.2 MiB/ 73.2 MiB]
Operation completed over 1 objects/73.2 MiB.
Copying file:///backup/laravel-backup-2023-03-30-13-46-25.sql [Content-Type=application/sql]...
/ [1 files][167.0 KiB/167.0 KiB]
Operation completed over 1 objects/167.0 KiB.
Backup complete and uploaded to Google Cloud Storage.
```


### Monitoring Script
```bash
Informasi Memory :
Memory terpakai    : 412Mi
Memory Total       : 965Mi
Persentase memory  : 42%

Informasi Disk:
Filesystem          Size Use%
/dev/root         24625M  57%
tmpfs               483M   0%
tmpfs               194M   1%
tmpfs                 5M   0%
/dev/sda15          105M   6%
tmpfs                97M   1%
```