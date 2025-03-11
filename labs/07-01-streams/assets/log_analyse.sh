#!/bin/bash

logfile_default="/home/moon/logs/log.txt"

logfile="${1:-$logfile_default}"

if [[ ! -f "$logfile" ]]; then
  echo There is no $logfile
fi

grep -vi "level=error\|level=warning" $logfile
grep -i "level=error\|level=warning" $logfile >&2