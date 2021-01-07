#!/bin/bash

# shellcheck source=/dev/null
. "$(dirname "$0")/config"

error_msg='Диск Toshiba на Raspberry Pi куда-то пропал'
info_msg='Диск Toshiba восстановлен'

check() {
  _ssh "df -h | grep $FS_ROOT"
}

fix() {
	_ssh "mount -o remount,rw $FS_DEV"
}
