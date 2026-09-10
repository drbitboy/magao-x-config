# safer-magaox-config (branch: claude-testing)

Single flat config directory covering both test hosts, mirroring how
`magao-x/config`'s repo root maps directly onto `/opt/MagAOX/config` --
no per-host subdirectories; which files apply to which host is
determined by `MAGAOX_ROLE` selecting a `proclist_$MAGAOX_ROLE.txt`,
not by directory structure.

- `MAGAOX_ROLE=magaox01`: reads `proclist_magaox01.txt`, runs
  `xis01` (xindiserver) + drivers `a01`, `b01`
- `MAGAOX_ROLE=magaox02`: reads `proclist_magaox02.txt`, runs
  `xis02` (xindiserver) + drivers `c02`, `d02`

All four drivers are `magaoxMaths` app instances. `otherDevName` forms
a cycle across both hosts:

    a01 (magaox01) --> c02 (magaox02)
    c02 (magaox02)  --> b01 (magaox01)
    b01 (magaox01)  --> d02 (magaox02)
    d02 (magaox02)  --> a01 (magaox01)

**No cross-host INDI server connections here.** `xis01.conf`/
`xis02.conf` each list only their own host's local drivers -- no
`remote=` entry, no `sshTunnels.conf`. Linking the two hosts'
otherDevName references to each other is the `safer` application's
job (the INDI store-and-forward bridge project), not xindiserver's
own remote-driver/SSH-tunnel chaining.

## What I could not confirm

I was not able to fetch or search either of the two branches
referenced for style:

- `magao-x/MagAOX`, branch `dev-resurrector`
- `drbitboy/magao-x-config`, branch `resurrector-minimal-test`

Neither surfaced in web search, which usually means private or not
indexed -- I can't browse a URL that hasn't come up that way. So this
is built from public MagAO-X documentation (the handbook at
magao-x.org and the Doxygen API docs) plus the literal spec given for
content, not checked against your actual branches' conventions.

Specific guesses, flagged in the files themselves too:

- `proclist_*.txt`: the handbook confirms this file's *purpose*
  (which apps start, which config name each uses) but not its literal
  line syntax. Used a plain two-column `appName configName` format.
- `xis*.conf`'s `local=` key name: confirmed from the API docs that
  xindiserver holds a "list of local drivers passed in by config,"
  but not the literal config key spelling.
- `a01.conf`/`b01.conf`/`c02.conf`/`d02.conf`: only `otherDevName` and
  `otherValName` are populated, per spec. Standard MagAOXApp config
  keys that likely exist in practice (RT scheduling priority, logging,
  etc.) are omitted since the required set for `magaoxMaths`
  specifically isn't known here.

If you can paste/upload a real `proclist_*.txt`, `xindiserver.conf`,
or a `find`/`tree` listing of the actual `resurrector-minimal-test`
tree, I'll correct this against the real format.
