# config
MagAO-X instrument configuration values

## Usage

For laboratory operation, switch to the `lab` branch of this repository in the clone on the control computer under `/opt/MagAOX/config`. For on-sky operation, switch to the `master` branch.

N.B. This README.md is in branch resurrector-16-maths-compression
     - See **Special configurations for minimal testing startup** below
     - This has 16 magAOXMaths INDI drivers

## Documentation

MagAO-X applications are documented in the [applications section](https://magao-x.org/instrument/apps_html) of the MagAO-X documentation.

  * [xindiserver options](https://magao-x.org/instrument/apps_html/md__home_jrmales_Source_MagAOX_apps_xindiserver_doc_xindiserver.html#autotoc_md4)

MagAO-X utilities are documented in the [utilities section](https://magao-x.org/instrument/util_html/) of the MagAO-X documentation.

  * [logdump options](https://magao-x.org/instrument/util_html/logdump.html#autotoc_md4)
  * evalINDI options
  * setINDI options

## Special configurations for minimal testing startup

Configures one MagAO-X role, which runs on one host:
- Role magaox01 on host @magaox01

Start either role first

* **proclist_magaox01.txt**
  * ```MAGAOX_ROLE=magaox01 resurrector_indi``` to start
  * Processes local to this "central" (i.e. AOC-like) node magaox01
    * isMagAOX-1 INDI server, listening on default port 7624
    * Sixteen magAOXMaths INDI drivers "maths_X" where X is a single hexadecimal digit
      * maths_0 - connects to maths_f
      * maths_1 - connects to maths_0
      * maths_2 - connects to maths_1
      * maths_3 - connects to maths_2
      * ...
      * maths_e - connects to maths_f
      * maths_f - connects to maths_e
