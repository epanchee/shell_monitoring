#!/bin/bash

# shellcheck source=/dev/null
. "$(dirname "$0")/config"

error_msg='Raspberry Pi не пингуется'
info_msg='Raspberry Pi теперь пингуется'

check() {
  ping -c 1 -W 1 "$PI_ADDR"
}
