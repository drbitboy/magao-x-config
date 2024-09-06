# config
MagAO-X instrument configuration values

## Big-test for resurrector

Start some number of magAOXMaths INDI drivers, plus and INDI server on node "A," plus the same on another node "B," where each magAOXMaths INDI driver talks to its counterpart on the other node.

N.B. This README.md is in branch resurrector-bigtest
     - See **Special configurations for bigtest startup** below

## Usage:  creating the configuration files

```scripts/00config_wrapper.bash <# of drivers per node>```

## Usage:  general

For resurrector testing operation, switch to the `resurrector-bigtest` branch of this repository in the clone on the control computer under `/opt/MagAOX/config`. For on-sky operation, switch to the `master` branch.

## Documentation

MagAO-X applications are documented in the [applications section](https://magao-x.org/instrument/apps_html) of the MagAO-X documentation.

  * [xindiserver options](https://magao-x.org/instrument/apps_html/md__home_jrmales_Source_MagAOX_apps_xindiserver_doc_xindiserver.html#autotoc_md4)

MagAO-X utilities are documented in the [utilities section](https://magao-x.org/instrument/util_html/) of the MagAO-X documentation.

  * [logdump options](https://magao-x.org/instrument/util_html/logdump.html#autotoc_md4)
  * evalINDI options
  * setINDI options

## Special configurations for bigtest startup

Configures two MagAO-X roles, which run on two separate nodes (hosts):
- Role magaox01 on node @mx11ts
- Role magaox02 on node @mx10ts

Start either role first
- All files should duplicated on both nodes

* **proclist_magaox01.txt**
  * ```MAGAOX_ROLE=magaox01 resurrector_indi``` to start on node mx11ts
  * Processes local to this central (i.e. AOC-like) "A" node on hostname mx11ts
    * isMagAOX01 INDI server, listening on default port 7624
      * Which will connect to INDI server on node mx10ts
    * magAOXmaths INDI drivers "dvr01_XXX"
      * where XXX are hexadecimal numbers

* **proclist_magaox02.txt**
  * ```MAGAOX_ROLE=magaox02 resurrector_indi``` to start on node mx10ts
  * Processes local to this satellite (i.e. RTC-like) "B" node on hostname mx10ts
    * INDI server, listening on default port 7624
      * Which will be connected to by INDI server on node mx11ts
      * **N.B. "B" node (role magaox02) INDI server does *not* connect back to "A" node (role magaox01) INDI server, but rather relies on connection from client INDI server on A to server INDI server on B to be able to connect to drivers on A node.
    * magAOXmaths INDI driver "dvr02_XXX"
      * where XXX are hexadecimal numbers
