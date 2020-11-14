#!/bin/bash

# shellcheck source=/dev/null
. "$(dirname "$0")/config"

MSG=${1:-Empty message}

curl -s -ssl --dns-servers 8.8.8.8 "https://api.telegram.org/bot$API_TOKEN/sendMessage?chat_id=$CHAT_ID&parse_mode=html&text=$MSG" &>/dev/null
