#!/bin/bash

# shellcheck source=/dev/null
. "$(dirname "$0")/config"
set -o pipefail

ssh -o ConnectTimeout=2 root@"$PI_ADDR" df -h | grep -q "$FS_ROOT" && exit 0
exit 1
