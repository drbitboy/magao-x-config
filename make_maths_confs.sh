#!/usr/bin/env bash

other=f

proclisttxt=proclist_magaox01.txt

sed -i '/^maths_.  *magAOXMaths *$/d' $proclisttxt

for this in 0 1 2 3 4 5 6 7 8 9 a b c d e f ; do

  conffile=maths_$this.conf

  cat > $conffile << EoF
myVal=val
otherDevName=maths_$other
otherValName=val
EoF

  echo "maths_$this           magAOXMaths" >> $proclisttxt

  other=$this
done
