!/bin/bash

# Check to make sure the user has entered exactly two args
if [ $# -ne 2 ]
then
    echo "Usage: beckup.sh <sourceDirectory> <target_directory>"
    echo "Please try again"
    exit 1
fi

# Check if rsync is installed 
if ! command -v rsync > /dev/null 2>&1
then
    echo "Script needs rsync to be installed."
    exit 2
fi

# Capture the current date to use as a record variable
current_date=$(date +%y-%m-%d)

rsync_options="-avb --backup-dir=$2/current --delete"

rsync $rsync_options "$1" "$2/current" 2>&1 | tee backup_$current_date.log
