#!/usr/bin/env bash

let dvrcount=$1 || exit 1

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

scripts/magaox.conf.bash
scripts/sshTunnels.conf.bash

for magnode in A B ; do
  scripts/dvr.conf.bash $magnode $dvrhex3s
  scripts/indiserver.conf.bash $magnode $dvrhex3s
  scripts/proclist_.txt.bash $magnode $dvrhex3s
done
