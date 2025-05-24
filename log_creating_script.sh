#!/bin/bash

LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="$LOG_DIR/archive"

mkdir -p "$LOG_DIR" "$ARCHIVE_DIR"

# 1. Create 20 fresh log files
for i in {1..20}; do
    FILE="$LOG_DIR/app_log_$i.log"
    echo "INFO: Log message $i on $(date)" > "$FILE"
    echo "DEBUG: Debugging app module $i" >> "$FILE"
done

# 2. Create 5 older log files (by setting modified time manually)
for i in {21..25}; do
    FILE="$LOG_DIR/app_log_$i.log"
    echo "INFO: OLD log $i generated on $(date -d '40 days ago')" > "$FILE"
    echo "WARN: Something happened long ago" >> "$FILE"
    
    # Change file modification time to 40 days ago
    touch -d "40 days ago" "$FILE"
done

echo "✅ 25 log files created. 5 are older than 30 days."

