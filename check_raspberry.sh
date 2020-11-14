#!/bin/bash

# shellcheck source=/dev/null
. "$(dirname "$0")/config"

ping -c 1 -W 1 "$PI_ADDR" &>/dev/null
