
### /scripts/common.bash
### - contains the suffixes for the two roles/INDI servers/drivers
### - also the node names

### Suffix for the two roles

suffix01=01
suffix02=02

### Roles for the two nodes

role01=magaox$suffix01
role02=magaox$suffix02

### Nodes (hostnames)

node01=mx11ts
node02=mx10ts

### The "other" node

othernode01=$node02
othernode02=$node01

### INDI server names:  isMagAOX01; isMagAOX02
### Driver prefix without suffix:  dvr01; dvr02

isPrefixNoSuffix=isMagAOX
dvrPrefixNoSuffix=dvr
