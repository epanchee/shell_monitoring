#!/bin/bash

# shellcheck source=/dev/null
. "$(dirname "$0")/config"

mkdir -p "$FLAGS_DIR"

perform_check() {
	local prog="$1"
	local error_msg="$2"
	local info_msg="$3"
	local fix="${4:-true}"
	local flag="$FLAGS_DIR/${prog%.*}"
	local ret

	$prog
	ret=$?
	[ $ret = 1 ] && $fix
	$prog
	ret=$?

	if [ $ret = 1 -a ! -f "$flag" ]; then
        	tg_say.sh "$error_msg" && touch "$flag"
	elif [ $ret = 0 -a -f "$flag" ]; then
        	rm "$flag" && tg_say.sh "$info_msg"

	fi
	sleep 1
	return 0
}


perform_check check_raspberry.sh "Raspberry Pi не пингуется" "Raspberry Pi теперь пингуется"
perform_check check_pi_disk.sh "Диск Toshiba на Raspberry Pi куда-то пропал" "Диск Toshiba восстановлен"
perform_check check_toshiba_writable.sh "Не получается записать данные на диск" "Теперь писать на диск опять можно" "ssh root@$PI_ADDR -o ConnectTimeout=2 mount -o remount,rw /dev/sda1"

