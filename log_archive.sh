#!/bin/bash

# verification arguments  usage : script log_directory

if [ "$#" -ne 1 ]; then
    echo "Usage $0 <log-directpry>"
    exit 1;
fi

LOG_DIR="$1"

# verify directory  exist

if [ ! -d "$LOG_DIR" ]; then
    echo "Error : dossier '$LOG_DIR' n'exist pas"
    exit 1;
fi

# create directory if not existe 

ARCHIVE_DIR="archive"
mkdir -p "$ARCHIVE_DIR"

#generate name file archive and current date as well as hour

TIMESTAMPS=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="log_archive_${TIMESTAMPS}.tar.gz"
ARCHIVE_PATH="${ARCHIVE_DIR}/${ARCHIVE_NAME}"

tar -czvf "$ARCHIVE_PATH" -C "$(dirname "$LOG_DIR")" "$(basename "$LOG_DIR")"

echo "Archive created at $(date +"%Y-%m-%d %H:%M:%S") : $ARCHIVE_NAME" >> "${ARCHIVE_DIR}/archive_log.txt"

echo "✅ Archived : $ARCHIVE_PATH"
