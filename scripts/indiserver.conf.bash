#!/usr/bin/env bash

one="$1" ; shift 1

mydir="$(dirname "${BASH_SOURCE[0]}")"
source "$mydir/node_setup.bash" $one 2>/dev/null \
|| echo "Usage:  ${BASH_SOURCE[0]} A|B [<dvr1-hex>[ <dvr2-hex>[ ...]]"

indiserverfn="$mag_isName.conf"
indiserverpath="$mydir/../$indiserverfn"

if [ "$mag_node" ] ; then

  nonAcomment="### Commented out for non-A node"
  [ "$mag_node" == "A" ] && unset cmt || cmt="#"
  [ "$cmt" ] || unset nonAcomment

  cat << EoFindiserver > "$indiserverpath"
########################################################################
### $indiserverfn:  processes of the "$mag_node" MaxAO-X node
###                 - role = $mag_role
### Special configuration for big-testing
########################################################################


########################################################################
### $indiserverfn:  INDI server of this node
### Special configuration for testing startup and operational sequencing
########################################################################

[indiserver]
f = /opt/MagAOX/drivers/fifos/indiserver.ctrl
#p = 7624
v = v,v,v
z = true

####################################
### Connect to remote drivers ${mag_otherdvrPrefix}XXX, partner to local
### drivers below, via remote INDI server
###
### - Refers to [${mag_role}_$mag_othersuffix] stanza in sshTunnels.conf
###   - direct TCP/IP socket connection ...
###     - to INDI server on host $mag_otherhostname at port 7624
###   - equivalent to many
###       remote.drivers@hosts=${mag_otherdvrPrefix}XXX@$mag_otherhostname:7624,
###     entries here because
###       local.drivers=${mag_otherdvrPrefix}XXX
###     entries will be found in other INDI server's configuration file
###     $mag_otherisName.conf
####################################
${nonAcomment}
${cmt}[remote]
${cmt}servers=$mag_otherisName@${mag_role}_$mag_othersuffix

####################################
### Only local INDI drivers on 7624 INDI server is magAOXMaths
### Local drivers connect on start by sending start command to INDI
### server control FIFO (.ctrl, above), but putting the local driver
### here will
### i) ensure crashed INDI server will also try to restart local drivers
### ii) ensure remote.servers=$mag_isName@${mag_otherrole}_$mag_role entry
###     in $mag_otherrole's INDI server configuration file find these
###     driver entries
####################################

[local]
EoFindiserver

  lineprefix="drivers =  "
  while [ "$1" ] ; do
    hex="$1" ; shift 1
    echo "$lineprefix $mag_dvrPrefix$hex" >> "$indiserverpath"
    lineprefix="drivers = ,"
  done

else
  false
fi
