#!/bin/bash -eu

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
source ${script_dir}/common.sh

function main() {
  for ct_number in $( get_ct_list )
  do
    ct_name=$( get_ct_name "${ct_number}" )

    name="lxc_status.${ct_name}"
    value=$( get_metric_from_lxc_info "${ct_number}" "State" | awk '{print $2}' )
    echo -e "${name}\t${value}\t$(date -u +%s)"
  done
}

main

