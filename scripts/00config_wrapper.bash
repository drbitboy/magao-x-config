#!/usr/bin/env bash

me="$0"
medir="$(dirname "$me")"

[ -d "$medir" ] \
|| ( echo 1>&2 "Usage:  [directory/]$0 <driver count per node>" && false ) \
|| exit 2

let dvrcount=$1 \
|| ( echo 1>&2 "Usage:  $0 <driver count per node>" && false ) \
|| exit 1

let count=0
dvrhex3s=""

hexdigits="0 1 2 3 4 5 6 7 8 9 a b c d e f"
for hex0 in $hexdigits ; do
  [ $count -ge $dvrcount ] && break
  for hex1 in $hexdigits ; do
    [ $count -ge $dvrcount ] && break
    for hex2 in $hexdigits ; do
      [ $count -ge $dvrcount ] && break
      dvrhex3s="$dvrhex3s $hex0$hex1$hex2"
      let ++count
    done
  done
done

"$medir"/magaox.conf.bash
"$medir"/sshTunnels.conf.bash

for magnode in A B ; do
  "$medir"/dvr.conf.bash $magnode $dvrhex3s
  "$medir"/indiserver.conf.bash $magnode $dvrhex3s
  "$medir"/proclist_.txt.bash $magnode $dvrhex3s
done

"$medir"/../../bin/resuctrl reset
