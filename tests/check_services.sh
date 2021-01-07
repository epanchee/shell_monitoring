#!/bin/bash

# shellcheck source=/dev/null
. "$(dirname "$0")/config"

dead=''

check() {
  set -o pipefail
  dead=''
  for service in $SERVICES; do
    _ssh "systemctl is-active $service" || dead="$service $dead"
  done
  [ -z "$dead" ] && return 0
  error_msg="Сервисы $dead не запущены"
  return 1
}

fix() {
  for service in $dead; do
    _ssh "systemctl restart $service"
  done
  return 1
}
