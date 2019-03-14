#!/bin/bash -eu

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
source ${script_dir}/common.sh

function main() {
  for ct_number in $( get_ct_list )
  do
    ct_name=$( get_ct_name "${ct_number}" )

    name="lxc_cpu.use.${ct_name}"
    value=$( get_metric_from_lxc_info "${ct_number}" "CPU" | awk '{print $3/1000000000}' )
    echo -e "${name}\t${value}\t$(date -u +%s)"
       
    name="lxc_cpu.user.${ct_name}"
    value=$( get_metric_from_cgroup "${ct_number}" cpuacct cpuacct.stat | awk '/user/ {print $2/100}' )
    echo -e "${name}\t${value}\t$(date -u +%s)"

    name="lxc_cpu.system.${ct_name}"
    value=$( get_metric_from_cgroup "${ct_number}" cpuacct cpuacct.stat | awk '/system/ {print $2/100} ')
    echo -e "${name}\t${value}\t$(date -u +%s)"
  done
}

main

