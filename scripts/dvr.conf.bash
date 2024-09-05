#!/usr/bin/env bash

one="$1" ; shift 1
mydir="$(dirname "${BASH_SOURCE[0]}")"
source "$mydir"/node_setup.bash $one

[ "$mag_node" ] \
|| ( echo "Usage  $0 A|B <dvr1-hex>[ <dvr2-hex>[ ...]]>" && false ) \
|| unset mag_node


if [ "$mag_node" ] ; then
  dvrpathPrefix="$mydir/../$mag_dvrPrefix"
  while [ "$1" ] ; do
    dvrID="$1" ; shift 1
    cat > "$dvrpathPrefix$dvrID.conf" << EoFdvr
### INDI driver $mag_dvrPrefix$dvrID
### - created by script ${BASH_SOURCE[0]}
### - from PWD=$PWD

myVal=val
otherDevName=$mag_otherdvrPrefix$dvrID
otherValName=val
EoFdvr
  done
else
  false
fi
