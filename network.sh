#!/bin/bash -eu

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
source ${script_dir}/common.sh

function main() {
  for ct_number in $( getCTList )
  do
    ct_name=$( getCTName "${ct_number}" )
    tx_value=$( lxc-info -H --name "${ct_number}" | sed -n 10p | awk '{print $3}' )
    rx_value=$( lxc-info -H --name "${ct_number}" | sed -n 11p | awk '{print $3}' )

    name="lxc_network.tx.${ct_name}"
    value="${tx_value}"
    echo -e "${name}\t${value}\t$(date -u +%s)"

		name="lxc_network.rx.${ct_name}"
    value="${rx_value}"
    echo -e "${name}\t${value}\t$(date -u +%s)"
  done
}

main

