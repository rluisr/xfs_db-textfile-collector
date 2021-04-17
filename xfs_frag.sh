#!/bin/bash
# Script for collecting xfs fragmentation.
# source: https://github.com/rluisr/xfs_db-textfile-collector

# Formatting done via shfmt -i 2
# https://github.com/mvdan/sh

set -eu

function echoHeader() {
  echo "# HELP xfs_db_frag fragmentation in percent"
  echo "# TYPE xfs_db_frag gauge"
}

function main() {
  devices=("$@")

  echoHeader

  for device in "${devices[@]}"; do
    frag_percent=$(/usr/sbin/xfs_db -c frag -r ${device} | awk 'NR==1' | awk '{print $7}' | sed -e 's/%//g')
    echo "xfs_db_frag{device=\"${device}\"} ${frag_percent}"
  done
}

main "$@"
