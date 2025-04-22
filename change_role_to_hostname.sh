#!/usr/bin/env bash

sudo \
  sed -i \
  -e "s/export *MAGAOX_ROLE=workstation/export MAGAOX_ROLE=$(hostname)/" \
  /etc/profile.d/magaox_role.sh

