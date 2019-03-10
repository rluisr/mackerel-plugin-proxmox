#!/bin/bash -eu

function getCTName() {
  ctid=$1
  vename=$( ( grep hostname | awk '{print $2}' ) < /etc/pve/lxc/"${ctid}".conf )
  echo "${vename}"
}

function getCTList() {
  array_cts=$( /usr/bin/lxc-ls -1 )
  echo "${array_cts}"
}
