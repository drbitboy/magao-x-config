#!/usr/bin/env bash

########################################################################
### /scripts/sshTunnels.conf.bash
########################################################################



zero="$0"
medir="$(dirname "$zero")"
target="$(basename ${zero%.bash})"

source "$medir/common.bash"

cat << EoFsshTunnels > "$medir/../$target"
### Connection from ${roleA} to ${roleB}
### - Hostname $hostnameA to hostname $hostnameB
### - local port set to -1 so a direct connection is made to the remote
###   server instead of to local sshDigger tunnel @localhost:<localPort>
### - compress has been removed, as it is not used in this case
[${roleA}_${suffixB}]
remoteHost = $hostnameB
remotePort = 7624
localPort  = -1

### Connection from ${roleB} to ${roleA}
### - Hostname $hostnameB to hostname $hostnameA
### - Same as above
[${roleB}_${suffixA}]
remoteHost = $hostnameA
remotePort = 7624
localPort  = -1
EoFsshTunnels
