#!/bin/bash -eu

function get_ct_name() {
  ctid=$1
  vename=$( ( grep hostname | awk '{print $2}' ) < /etc/pve/lxc/"${ctid}".conf )
  echo "${vename}"
}

function get_ct_list() {
  array_cts=$( /usr/bin/lxc-ls -1 )
  echo "${array_cts}"
}

function get_metric_from_lxc_info() {
  ctid=$1
  metric=$2
  value=$( lxc-info -H --name "${ctid}" | grep "${metric}:" )
  echo ${value}
}

function get_metric_from_cgroup() {
  ctid=$1
  key=$2
  value=$3
  cgroup="/sys/fs/cgroup/${key}/lxc/${ctid}/${value}"

  if [ -r "${cgroup}" ]; then
    cat "${cgroup}"
  fi
}
