# config
MagAO-X instrument configuration values

## Usage

For laboratory operation, switch to the `lab` branch of this repository in the clone on the control computer under `/opt/MagAOX/config`. For on-sky operation, switch to the `master` branch.

N.B. This README.md is in branch resurrector-minimal-testing
     - See **Special configurations for minimal testing startup** below

## Documentation

MagAO-X applications are documented in the [applications section](https://magao-x.org/instrument/apps_html) of the MagAO-X documentation.

  * [xindiserver options](https://magao-x.org/instrument/apps_html/md__home_jrmales_Source_MagAOX_apps_xindiserver_doc_xindiserver.html#autotoc_md4)

MagAO-X utilities are documented in the [utilities section](https://magao-x.org/instrument/util_html/) of the MagAO-X documentation.

  * [logdump options](https://magao-x.org/instrument/util_html/logdump.html#autotoc_md4)
  * evalINDI options
  * setINDI options

## Special configurations for minimal testing startup

Configures two MagAO-X roles, which run on two separate hosts:
- Role magaox01 on host @magaox01
- Role magaox02 on host @magaox02

Start either role first

* **proclist_magaox01.txt**
  * Processes local to this "central" (i.e. AOC-like) node magaox01
    * isMagAOX-1 INDI server, listening on default port 7624
      * Which will connect to INDI server on node magaox02
    * magAOXmaths INDI driver "maths_x"

* **proclist_magaox02.txt**
  * Processes local to this "satellite" (i.e. RTC-like) node magaox02
    * INDI server, listening on default port 7624
      * Which be connected to by INDI server on node magaox01
    * magAOXmaths INDI driver "maths_y"
