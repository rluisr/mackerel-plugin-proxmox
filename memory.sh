#!/bin/bash -eu

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
source ${script_dir}/common.sh

function main() {
  for ct_number in $( get_ct_list )
  do
    ct_name=$( get_ct_name "${ct_number}" )

    name="lxc_memory.max.${ct_name}"
    value=$( get_metric_from_cgroup "${ct_number}" memory memory.max_usage_in_bytes )
    echo -e "${name}\t${value}\t$(date -u +%s)"

    name="lxc_memory.used.${ct_name}"
    value=$( get_metric_from_cgroup "${ct_number}" memory memory.usage_in_bytes )
    echo -e "${name}\t${value}\t$(date -u +%s)"
  done
}

main

