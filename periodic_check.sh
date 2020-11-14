#!/bin/bash

shopt -s nullglob

# shellcheck source=/dev/null
. "$(dirname "$0")/config"

for i in tests/*
do
  perform_test "$i"
done

exit 0
