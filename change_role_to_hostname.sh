#!/usr/bin/env bash

sudo \
  sed -i \
  -e "s/export *MAGAOX_ROLE=.*/export MAGAOX_ROLE=$(hostname)/" \
  /etc/profile.d/magaox_role.sh

