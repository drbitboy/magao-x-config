#!/usr/bin/env bash

one="$1" ; shift 1

mydir="$(dirname "${BASH_SOURCE[0]}")"
source "$mydir/node_setup.bash" $one 2>/dev/null \
|| echo "Usage:  ${BASH_SOURCE[0]} A|B [<dvr1-hex>[ <dvr2-hex>[ ...]]"

proclistfn="proclist_$mag_role.txt"
proclistpath="$mydir/../$proclistfn"

if [ "$mag_node" ] ; then
  cat << EoFproclist > "$proclistpath"
########################################################################
### $proclistfn:  processes of the "$mag_node" MaxAO-X node
### Special configuration for big-testing
########################################################################

####################################
### Processes local to this "$mag_node" node (role ${mag_role})
### * INDI server, listening on default port 7624
###   * Which will either connect to, or be connected to by, INDI server
###     on hostname $mag_otherhostname
### * Multiple magAOXmaths INDI drivers "${mag_dvrPrefix}XXX"
####################################

###process-ID     Executable

$mag_isName        xindiserver

### INDI drivers ${mag_dvrPrefix}XXX running magAOXMaths follow:

EoFproclist

  while [ "$1" ] ; do
    hex="$1" ; shift 1
    echo "$mag_dvrPrefix$hex         magAOXMaths" >> "$proclistpath"
  done

else
  false
fi

mag_dvrPrefix=dvr02_
mag_hostname=mx10ts
mag_isName=isMagAOX02
mag_node=B
mag_otherdvrPrefix=dvr01_
mag_otherhostname=mx11ts
mag_role=magaox02
mag_suffix=02
