#!/bin/bash
################################################################
# Project       : GENERIC                                      #
# Description   : Script to Check Latest Backup File Status    #
#                                                              #
# Originated by : VAISHNAV PP  [https://github.com/Y2kz]       #
# Date          : 11-07-2025                                   #
################################################################

source /etc/profile

usage() {
    echo "Usage: $0 -P <Backup path> [-S <Suffix as date format>]"
    echo "Example: $0 -P /opt/test/var/Backup/App"
    exit 3
}

# Parse arguments
while getopts "P:S:" opt; do
    case "$opt" in
        P ) BKP_PATH="$OPTARG" ;;
        S ) SUFFIX_FMT="$OPTARG" ;;
        * ) usage ;;
    esac
done

# Validate backup path
if [ -z "$BKP_PATH" ]; then
    echo "Backup path not specified"
    usage
fi

if [ ! -d "$BKP_PATH" ]; then
    echo "Backup path '$BKP_PATH' does not exist"
    exit 2
fi

# Handle optional suffix
if [ -n "$SUFFIX_FMT" ]; then
    SUFFIX=$(date +"$SUFFIX_FMT")
    BKP_DIR="$BKP_PATH/$SUFFIX"
else
    BKP_DIR="$BKP_PATH"
fi

# Try to change to the backup directory
if ! cd "$BKP_DIR" 2>/dev/null; then
    echo "Cannot access backup directory '$BKP_DIR'"
    exit 2
fi

# Find most recently modified file (exclude dirs)
LATEST_FILE=$(find . -type f -printf "%T@ %p\n" | sort -n | tail -1 | awk '{print $2}')

if [ -z "$LATEST_FILE" ]; then
    echo "No backup files found in '$BKP_DIR'"
    exit 2
fi

# Extract dates
BACKUP_DATE=$(stat -c %y "$LATEST_FILE" | awk '{print $1}')   # e.g., 2025-07-08
TODAY_DATE=$(date +%F)

# Compare
if [ "$BACKUP_DATE" == "$TODAY_DATE" ]; then
    echo "Backup is Up-To-Date (Latest: $LATEST_FILE on $BACKUP_DATE)"
    exit 0
else
    echo "Backup is NOT Up-To-Date (Latest: $LATEST_FILE on $BACKUP_DATE)"
    exit 2
fi
