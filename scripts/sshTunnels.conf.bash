### Connection from magaox01 to magaox02 (hostname mx10ts)
### - local port set to -1 so a direct connection is made to the remote
###   server instead of to local sshDigger tunnel @localhost:<localPort>
### - compress has been removed, as it is not used in this case
[magaox01_02]
remoteHost = mx10ts
remotePort = 7624
localPort  = -1

### Connection from magaox02 to magaox01 (hostname mx11ts)
### - Same as above
[magaox02_01]
remoteHost = mx11ts
remotePort = 7624
localPort  = -1

