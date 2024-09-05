#!/usr/bin/env bash

########################################################################
### /scripts/sshTunnels.conf.bash
########################################################################



zero="$0"
medir="$(dirname "$zero")"
target="$(basename ${zero%.bash})"


cat << EoFsshTunnels > "$medir/../$target"
### Connection from magaox${mag_suffixA} to magaox${mag_suffixB} (hostname $mag_nodeA)
### - local port set to -1 so a direct connection is made to the remote
###   server instead of to local sshDigger tunnel @localhost:<localPort>
### - compress has been removed, as it is not used in this case
[magaox${mag_suffixA}_B]
remoteHost = $mag_nodeB
remotePort = 7624
localPort  = -1

### Connection from magaox${mag_suffixB} to magaox${mag_suffixA} (hostname $mag_nodeA)
### - Same as above
[magaox${mag_suffixB}_01]
remoteHost = $mag_nodeA
remotePort = 7624
localPort  = -1
EoFsshTunnels

