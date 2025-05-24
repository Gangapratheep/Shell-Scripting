#!/bin/bash

log_dir="/var/log/myapp"
backup_dir="/var/log/myapp/archive"
timestamp=$(date + "%Y-%m-%d %H-%M-%S")

mkdir -p "$backup_dir"

find "$log_dir" -type f -name "*.log" -exec gzip {} \;

find "$log_dir" -type f -name "*.log.gz" -exec mv {} "$backup_dir"/ \;

find "$backup_dir" -type f -name "*.log.gz" -mtime +30 -exec rm -f {} \;


