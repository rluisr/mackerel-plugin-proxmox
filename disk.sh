#!/bin/bash -eu

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
source ${script_dir}/common.sh

function get() {
  ctid=$1
  value=$( lxc-attach --name "${ctid}" -- df -P / 2>/dev/null )
  echo ${value}
}

function main() {
  for ct_number in $( get_ct_list )
  do
    ct_name=$( get_ct_name "${ct_number}" )
    
    name="lxc_disk.size.${ct_name}"
    value=$( get "${ct_number}" | awk '{printf "%.0f", $9*1024}' )
    echo -e "${name}\t${value}\t$(date -u +%s)"

    name="lxc_disk.used.${ct_name}"
    value=$( get "${ct_number}" | awk '{printf "%.0f", $10*1024}' )
    echo -e "${name}\t${value}\t$(date -u +%s)"
  done
}

main

