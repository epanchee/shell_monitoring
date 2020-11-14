#!/bin/bash

# shellcheck source=/dev/null
. "$(dirname "$0")/config"

error_msg='Не получается записать данные на диск'
info_msg='Теперь писать на диск опять можно'

check() {
  ssh -o ConnectTimeout=2 root@"$PI_ADDR" "touch $FS_ROOT/test && rm $FS_ROOT/test" && return 0
  return 1
}

fix() {
  ssh root@"$PI_ADDR" -o ConnectTimeout=2 mount -o remount,rw "$FS_DEV" && return 0
  return 1
}
