#!/bin/bash

# shellcheck source=/dev/null
. "$(dirname "$0")/config"

dead=''

check() {
  set -o pipefail
  dead=''
  for service in $SERVICES; do
    ssh -o ConnectTimeout=2 root@"$PI_ADDR" systemctl is-active "$service" || dead="$service $dead"
  done
  [ -z "$dead" ] && return 0
  error_msg="Сервисы $dead не запущены"
  return 1
}

fix() {
  for service in $dead; do
    ssh root@"$PI_ADDR" -o ConnectTimeout=2 systemctl restart "$service"
  done
  return 1
}
