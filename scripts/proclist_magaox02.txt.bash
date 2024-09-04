########################################################################
### proclist_magaox02.txt:  processes of the "satellite" MaxAO-X node
### Special configuration for testing startup and operational sequencing
########################################################################

####################################
### Processes local to this "satellite" (i.e. RTC-like) node magaox02
### * INDI server, listening on default port 7624
###   * Which be connected to by INDI server on node magaox01
### * magAOXmaths INDI driver "maths_y"
####################################

###process-ID     Executable

isMagAOX02        xindiserver

maths_2           magAOXMaths
