# config
MagAO-X instrument configuration values

## Usage

For laboratory operation, switch to the `lab` branch of this repository in the clone on the control computer under `/opt/MagAOX/config`. For on-sky operation, switch to the `master` branch.

## Documentation

MagAO-X applications are documented in the [applications section](https://magao-x.org/instrument/apps_html) of the MagAO-X documentation.

  * [xindiserver options](https://magao-x.org/instrument/apps_html/md__home_jrmales_Source_MagAOX_apps_xindiserver_doc_xindiserver.html#autotoc_md4)

MagAO-X utilities are documented in the [utilities section](https://magao-x.org/instrument/util_html/) of the MagAO-X documentation.

  * [logdump options](https://magao-x.org/instrument/util_html/logdump.html#autotoc_md4)
  * evalINDI options
  * setINDI options

## Special configurations for testing startup and operational sequencing

Configures three MagAO-X roles, which can all run simultaneously on the same host

### **proclist_i7624.txt**
* ```MAGAOX_ROLE=i7624 resurrector_indi``` to start
* **is7624.conf** <= INDI server on port 7624
  * Two remote drivers
    * maths_y_i8624@seq_i8624_indi - remote magAOXmaths app
    * tss_i9624@seq_i9624_indi - remote timeSeriesSimulator app
* One INDI driver
  * **maths_x_i7624.conf** <= magAOXmaths app
    * connects to maths_y_i8624 as "other" magAOXmaths app
* Two non-INDI drivers
  * **sshTunnels.conf** <= sshDigger apps
    * **seq_i8624_indi**, connects to INDI server on localhost port 8624 (below)
    * **seq_i9624_indi**, connects to INDI server on localhost port 9624 (below)
    * N.B. these require suitable configuration under \~/.ssh/
      * Empty-passphrase SSH key files **\~/.ssh/id_rsa** and **\~/.ssh/id_rsa.pub**
      * Contents of \~/.ssh/id_rsa.pub as one line of **\~/.ssh/authorized_keys**
      * Permissions _apropo_ SSH
    * N.B. these are not required as @localhost:8624 and @localhost:9624 could be used directly in **is7624.conf**

### **proclist_i8624.txt**
* ```MAGAOX_ROLE=i8624 resurrector_indi``` to start
* MAGAOX_ROLE=i8624 resurrector_indi
* **is8624.conf** <= INDI server on port 8624
* One INDI driver
  * **maths_y_i8624.conf** <= magAOXmaths app
    * connects to maths_x_i7624 (above) as "other" magAOXmaths app

### **proclist_i9624.txt** <= MAGAOX_ROLE=i9624
* ```MAGAOX_ROLE=i9624 resurrector_indi``` to start
* **is9624.conf** <= INDI server on port 9624
* One INDI driver
  * **tss_i9624.conf** <= timeSeriesSimulator app
