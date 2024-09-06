#/usr/bin/env bash

source "$(dirname ${BASH_SOURCE[0]})/common.bash"

mag_node="$1"

case "$mag_node" in
  A|a) mag_node="A"
       mag_role="$roleA"
       mag_otherrole="$roleB"
       mag_hostname="$hostnameA"
       mag_otherhostname="$otherhostnameA"
       mag_suffix="$suffixA"
       mag_othersuffix="$suffixB"
       mag_isName="$isNameA"
       mag_otherisName="$isNameB"
       mag_dvrPrefix="$dvrPrefixA"
       mag_otherdvrPrefix="$otherdvrPrefixA"
      ;;
  B|b) mag_node="B"
       mag_role="$roleB"
       mag_otherrole="$roleA"
       mag_hostname="$hostnameB"
       mag_otherhostname="$otherhostnameB"
       mag_suffix="$suffixB"
       mag_othersuffix="$suffixA"
       mag_isName="$isNameB"
       mag_otherisName="$isNameA"
       mag_dvrPrefix="$dvrPrefixB"
       mag_otherdvrPrefix="$otherdvrPrefixB"
      ;;
  *) echo "@ERROR:  invalid node (should be A or B)@@Usage:  source ${BASH_SOURCE[0]} A|B@" | tr @ \\n 1>&2
     unset mag_node
     ;;
esac

if [ "$mag_node" ] ; then
  true
else
  unset mag_role
  unset mag_otherrole
  unset mag_hostname
  unset mag_otherhostname
  unset mag_suffix
  unset mag_othersuffix
  unset mag_isName
  unset mag_otherisName
  unset mag_dvrPrefix
  unset mag_otherdvrPrefix
  false
fi
