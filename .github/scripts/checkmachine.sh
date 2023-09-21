#!/bin/bash

set -o pipefail

log=$(
machine=$( flyctl machine list --json --app "terbangan" | jq --raw-output 'map(.id)[0]' )
echo "Attempting to start machine ${machine} for app ..."
flyctl machine status "${machine}"
echo ""
)
echo -e "log<<EOF\n$log\nEOF" >> $GITHUB_OUTPUT
