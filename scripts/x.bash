#/usr/bin/env bash

echo "$1" | grep -Eq '^([1-9][0-9]*|)$' \
|| ( echo "Usage:  $0 [decimal-number]" && false ) \
|| exit 1

[ "$1" ] && let max=$1 || let max=10

let sofar=0
for hi in 0 1 2 3 4 5 6 7 8 9 a b c d e f ; do
  [ $sofar -ge $max ] && break
  for mid in 0 1 2 3 4 5 6 7 8 9 a b c d e f ; do
    [ $sofar -ge $max ] && break
    for lo in 0 1 2 3 4 5 6 7 8 9 a b c d e f ; do
      [ $sofar -ge $max ] && break
      echo $hi$mid$lo
      let ++sofar
    done
  done
done
