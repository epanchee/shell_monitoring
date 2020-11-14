#!/bin/bash

# shellcheck source=/dev/null
. "$(dirname "$0")/config"

for i in check_raspberry check_toshiba_writable check_pi_disk
do
  perform_test "$i.sh"
done
exit 0
