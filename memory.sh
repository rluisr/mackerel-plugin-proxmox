#!/bin/bash -eu

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
source ${script_dir}/common.sh

function getCTList() {
  array_cts=$( /usr/bin/lxc-ls -1 )
  echo "${array_cts}"
}

function main() {
  for ct_number in $( getCTList )
  do
    ct_name=$( getCTName "${ct_number}" )

    name="lxc_memory.max.${ct_name}"
    value=$( cat /sys/fs/cgroup/memory/lxc/"${ct_number}"/memory.limit_in_bytes )
    echo -e "${name}\t${value}\t$(date -u +%s)"

    name="lxc_memory.usage.${ct_name}"
    value=$( cat /sys/fs/cgroup/memory/lxc/"${ct_number}"/memory.usage_in_bytes )
    echo -e "${name}\t${value}\t$(date -u +%s)"
  done
}

main

