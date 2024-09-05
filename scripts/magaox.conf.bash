#!/usr/bin/env bash

########################################################################
### /scripts/magaox.conf.bash
########################################################################

zero="${BASH_SOURCE[0]}"
medir="$(dirname "$zero")"
target="$(basename ${zero%.bash})"

cat << EoFsshTunnels > "$medir/../$target"
indiserver_ctrl_fifo = /opt/MagAOX/drivers/fifos/indiserver.ctrl
EoFsshTunnels
