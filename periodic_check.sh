#!/bin/bash

shopt -s nullglob

# shellcheck source=/dev/null
. "$(dirname "$0")/config"

mkdir -p "$LOG_DIR/old"
now_hour="$(date +%H)"
now=$(date +%s)
for log in "$LOG_DIR/"*; do
  mod_time="$(stat -c %z "$log")"
  modhour="$(date +%H "${mod_time%.*}")"
  # shellcheck disable=SC2219
  let diff=$now_hour-$modhour
  [ -f "$log" -a $diff -ne 0 ] && mv "$log" "$LOG_DIR/old/${log##*/}.$now"
done

for old_log in "$LOG_DIR/old/"*; do
  log_time=${old_log##*.}
  # shellcheck disable=SC2219
  let diff=$now-$log_time
  [ -f "$old_log" -a $diff -gt "${LOG_ROTATION_TIME:-43200}" ] && rm "$old_log"
done

for i in tests/*
do
  [ -f "$i" ] && perform_test "$i"
done

exit 0
