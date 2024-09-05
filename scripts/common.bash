
### /scripts/common.bash
### - contains the suffixes for the two roles/INDI servers/drivers
### - also the hostnames

### Suffix for the two nodes

suffixA=01
suffixB=02

### Roles for the two nodes

roleA=magaox$suffixA
roleB=magaox$suffixB

### Hostnames

hostnameA=mx11ts
hostnameB=mx10ts

### The "other" hostname

otherhostnameA=$hostnameB
otherhostnameB=$hostnameA

### INDI server names (xindiserver -n <INDI-server-name>

isNameA=isMagAOX$suffixA
isNameB=isMagAOX$suffixB

### Driver prefix without suffix
### - full driver name will be dvr<suffix>_XXX

dvrPrefixA=dvr${suffixA}_
dvrPrefixB=dvr${suffixB}_

### Other driver prefix without suffix

otherdvrPrefixA=$dvrPrefixB
otherdvrPrefixB=$dvrPrefixA
