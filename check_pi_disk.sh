#!/bin/bash

# shellcheck source=/dev/null
. "$(dirname "$0")/config"

error_msg='Диск Toshiba на Raspberry Pi куда-то пропал'
info_msg='Диск Toshiba восстановлен'

check() {
  set -o pipefail
  ssh -o ConnectTimeout=2 root@"$PI_ADDR" df -h | grep -q "$FS_ROOT" && return 0
  return 1
}
