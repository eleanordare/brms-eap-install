# brms-eap-install

## Synopsis

This repository provides bash scripts for installing BRMS 6.4 and EAP 7.0, with additional options to apply future BRMS patches, automatically configure roles in Business Central, and/or install a custom login module.

#### Includes:
- **setup.sh** : retrieves files from **installs** directory, installs EAP 7.0.3 and BRMS 6.4.0 in **target** directory with custom login module included, configures roles if variables `ROLE_TO_CHANGE` and `NEW_ROLE` are changed
- **apply_patch.sh** : set up for future BRMS patches to be installed
- **configs/** : includes **eap-install.xml** and **eap-install.xml.variables** to configure EAP with an admin user on install
- **installs/** : destination for downloaded product binaries, includes **CustomLoginModule.jar** and **standalone.xml** for installing login module


## Getting Started
1. Download the product binaries from the [Red Hat Customer Portal](https://access.redhat.com) and copy them to the installs directory.
  - [Red Hat JBoss BRMS 6.4.0 Deployable for EAP 7](https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=48291&product=brms)
  - [Red Hat JBoss Enterprise Application Platform 7.0.0 Installer](https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=43881&product=appplatform)
  - [Red Hat JBoss Enterprise Application Platform 7.0.3 Patch](https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=47721)
2. Run `./setup.sh`


## Repository
