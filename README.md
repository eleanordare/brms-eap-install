# brms-eap-install

## Synopsis

This repository provides bash scripts for installing BRMS 6.4 and EAP 7.0, with additional options to apply future BRMS patches, automatically configure roles in Business Central, and/or install a custom login module.

#### Includes:
- **setup.sh** retrieves files from **installs** directory, installs EAP 7.0.3 and BRMS 6.4.0 in **target** directory with custom login module included, and configures roles if variables `ROLE_TO_CHANGE` and `NEW_ROLE` are changed
- **apply_patch.sh** is set up for future BRMS patches to be installed
- **configs/** includes **eap-install.xml** and **eap-install.xml.variables** to configure EAP with an admin user on install
- **installs/** is the destination for downloaded product binaries, also includes **CustomLoginModule.jar** and **standalone.xml** for installing login module


## Getting Started
1. Download the product binaries from the [Red Hat Customer Portal](https://access.redhat.com) and copy them to the **installs** directory.
  - [Red Hat JBoss BRMS 6.4.0 Deployable for EAP 7](https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=48291)
  - [Red Hat JBoss Enterprise Application Platform 7.0.0 Installer](https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=43881)
  - [Red Hat JBoss Enterprise Application Platform 7.0.3 Patch](https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=47721)
2. Ensure that the `BRMS`, `EAP`, and `EAP_PATCH` variables in **setup.sh** are the same names as the files you just downloaded into **installs**.
3. If you want to configure a default admin user for EAP, update the password in **configs/eap-install.xml.variables**.
4. Make sure all dependencies are installed:
  - `yum install unzip` (to unzip EAP/BRMS patch files)
  - `yum install sed` (for BRMS role-configuration)
  - `yum install java` (to run EAP installer with configuration files)
5. Run `./setup.sh` in the root **brms-eap-install** directory.


After the **setup.sh** script is completed, **jboss-eap-7.0** will be installed in the **targets** directory. To start up EAP in standalone mode, run `./target/jboss-eap-7.0/bin/standalone.sh`.


## Applying BRMS Patches

The **apply_patch.sh** script is designed to install future updates to BRMS.

#### Setup and installation:
1. Download the patch zip file from the [Red Hat Customer Portal](https://access.redhat.com/jbossnetwork/restricted/listSoftware.html?product=brms&downloadType=patches&version=6.4) into the **installs** directory.
2. Update the `JBOSS_HOME` variable to point to your jboss-eap-7.0 directory.
3. Update the `BRMS_PATCH` and `BRMS_PATCH_NAME` variables with the same name as the patch zip file you downloaded into the **installs** directory.
4. Confirm that your version of EAP is correct (at line 29).
5. Run `./apply_patch.sh`
