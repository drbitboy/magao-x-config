########################################################################
### proclist_magaox01.txt:  processes of the "central" MaxAO-X node
### Special configuration for testing startup and operational sequencing
########################################################################

####################################
### Processes local to this "central" (i.e. AOC-like) node magaox01
### * INDI server, listening on default port 7624
###   * Which will connect to INDI server on node magaox02
### * magAOXmaths INDI driver "maths_x"
####################################

###process-ID     Executable

isMagAOX01        xindiserver

maths_1           magAOXMaths
