#!/usr/bin/env bash

########################################################################
### /scripts/sshTunnels.conf.bash
########################################################################



zero="$0"
medir="$(dirname "$zero")"
target="$(basename ${zero%.bash})"


cat << EoFsshTunnels > "$medir/../$target"
### Connection from magaox${suffix01} to magaox${suffix02} (hostname $node01)
### - local port set to -1 so a direct connection is made to the remote
###   server instead of to local sshDigger tunnel @localhost:<localPort>
### - compress has been removed, as it is not used in this case
[magaox${suffix01}_02]
remoteHost = $node02
remotePort = 7624
localPort  = -1

### Connection from magaox${suffix02} to magaox${suffix01} (hostname $node01)
### - Same as above
[magaox${suffix02}_01]
remoteHost = $node01
remotePort = 7624
localPort  = -1
EoFsshTunnels

