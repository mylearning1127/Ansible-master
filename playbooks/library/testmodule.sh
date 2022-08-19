#!/bin/bash
#
# This script accepts two inputs
# 1. app
# 2. appv
# and prints it as a message

changed="false"

source $1

display="Received app  $app with version as $appv"



if [ "$app" == "python" ]; then
  changed="true"
fi

printf '{"changed": %s, "msg": "%s"}' "$changed" "$display"

exit 0

