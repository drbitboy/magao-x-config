#!/usr/bin/env bash

one="$1"
source "$(dirname "${BASH_SOURCE[0]}")"/node_setup.bash $one

dvrID="$2"

[ "$mag_node" ] \
&& echo "$dvrID" | grep -q '^[0-9a-f][0-9a-f][0-9a-f]$' \
|| ( echo "Usage  $0 A|B <driver ID as three lowercase hex digits>" && false ) \
|| unset mag_node

if [ "$mag_node" ] ; then
  cat << EoFdvr
### INDI driver $mag_dvrPrefix$dvrID
### - created by script ${BASH_SOURCE[0]}
### - from PWD=$PWD

myVal=val
otherDevName=$mag_otherdvrPrefix$dvrID
otherValName=val
EoFdvr
else
  false
fi


