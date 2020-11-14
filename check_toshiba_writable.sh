#!/bin/bash

# shellcheck source=/dev/null
. "$(dirname "$0")/config"

error_msg='Диск Toshiba на Raspberry Pi куда-то пропал'
info_msg='Диск Toshiba восстановлен'

check() {
  ssh -o ConnectTimeout=2 root@"$PI_ADDR" "touch $FS_ROOT/test && rm $FS_ROOT/test" && return 0
  return 1
}
