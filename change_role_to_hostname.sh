#!/usr/bin/env bash

hn="$(hostname)"
pltxt="proclist_$hn.txt"

( cd "$(dirname "$0")" \
&& [ "${PWD}" == "/opt/MagAOX/config" ] \
|| ( "ERROR:  script [$0] is not in /opt/MagAOX/config/; $0 exiting ..." && false ) \
) || exit 1

[ -r "$pltxt" ] \
|| ( "ERROR:  hostnamed-proclist [$pltxt] is not readable; $0 exiting ..." && false ) \
|| exit 2

echo -n "Old role:  " && cat /etc/profile.d/magaox_role.sh

sudo \
  sed -i \
  -e "s/export *MAGAOX_ROLE=.*/export MAGAOX_ROLE=$(hostname)/" \
  /etc/profile.d/magaox_role.sh

echo -n "New role:  " && cat /etc/profile.d/magaox_role.sh
