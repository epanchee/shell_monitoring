#!/bin/bash

# shellcheck source=/dev/null
. "$(dirname "$0")/config"

ssh -o ConnectTimeout=2 root@"$PI_ADDR" "touch $FS_ROOT/test && rm $FS_ROOT/test" && exit 0
exit 1
