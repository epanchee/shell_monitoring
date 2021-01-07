#!/bin/bash

# shellcheck source=/dev/null
. "$(dirname "$0")/config"

error_msg='Не получается записать данные на диск'
info_msg='Теперь писать на диск опять можно'

check() {
  _ssh "touch $FS_ROOT/test && rm $FS_ROOT/test"
}

fix() {
  _ssh mount -o remount,rw "$FS_DEV"
}
