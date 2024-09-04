########################################################################
### isMagAOX02.conf:  INDI server of the "central" MagAO-X node
### Special configuration for testing startup and operational sequencing
########################################################################

[indiserver]
f = /opt/MagAOX/drivers/fifos/indiserver.ctrl
#p = 7624
v = v,v,v
z = true

####################################
### Only local INDI driver on 7624 INDI server is magAOXMaths
### Local drivers connect on start by sending start command to INDI
### server control FIFO (.ctrl, above), but putting the local driver
### here will
### i) ensure crashed INDI server will also try to restart local drivers
### ii) ensure remote.servers=isMagAOX01@magaox01_02 entry in maxaox01
###     host's INDI server configuration file find these driver entries
####################################

[local]
drivers=maths_2

####################################
### Connect to remote driver maths_2, partner to local maths_1 above,
### via remote INDI server
###
### - Refers to [magaox02_01] stanza in sshTunnels.conf
###   - direct TCP/IP socket connection ...
###     - to host mx11ts on port 7624
###   - equivalent to remote.drivers@hosts=maths_1@magaox02_01:7624,
###     because local.drivers=maths_1 will be found in isMagAOX01.conf
####################################

[remote]
servers=isMagAOX01@magaox02_01
