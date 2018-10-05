# Changelog

## 17.0915.1 (2017-09-15)

* Upgrade CentOS 7 to 7.4.1708

## 17.0909.1 (2017-09-09)

* Revert back to BIOS naming on CentOS 7, does not work with Parallels

## 17.0904.1 (2017-09-04)

* Upgrade CentOS 6 image to version 6.9
* Added `cleanup_build_tools` variable to control removal of build tools
* Use consistent device naming on CentOS 7 now that it is supported by vagrant
* Drop minor version from box names
* Remove CentOS 5.x - EOL

## 2.0.21 (2016-12-15)

* Port private_network workaround from upstream CentOS box
* Fix centos511-desktop build on paralllels

## 2.0.20 (2016-12-14)

* Add CentOS 7.3 template
* Remove network workaround that was needed for CentOS 7.x in older versions
  of vagrant to avoid race condition

## 2.0.19 (2016-12-11)

* Use virtio for better network performance
* Workaround for gurumediatation error w/CentOS 5.x on VirtualBox 5.1.x
* Add CentOS 5.11 desktop template

## 2.0.18 (2016-12-03)

* Machine-id is now emptied not removed
* Upgrade VirtualBox Guest Additions to 5.1.10
* Upgrade Parallels tools to 12.1.1

## 2.0.17 (2016-11-12)

* Fix issue with Parallels tools install
* Upgrade VMware tools to 10.0.10.3275 for VMware Fusion 8.5.1
* Upgrade Parallels tools to 12.1.0
* Upgrade VirtualBox Guest Additions to 5.1.8

## 2.0.15 (2016-09-26)

* Upgrade to Parallels 12
* Upgrade Parallels tools to 12.0.2
* Upgrade VMware tools to 10.0.10 for VMware Fusion 8.5.0

## 2.0.14 (2016-08-27)

* Upgrade VirtualBox Guest Additions to 5.0.26
* Upgrade Parallels tools to 11.2.1

## 2.0.14 (2015-05-22)

* Upgrade VirtualBox Guest Additions to 5.0.20
* Upgrade Parallels tools to 11.2.0
* Upgrade VMware Guest Additions to 10.0.6

## 2.0.13 (2015-03-16)

* Upgrade VirtualBox Guest Additions to 5.0.16

## 2.0.12 (2015-02-22)

* Upgrade Docker to 1.10.1
* Upgrade VirtualBox Guest Additions to 5.0.14
* Upgrade Parallels tools to 11.1.3

## 2.0.11 (2015-01-09)

* Upgrade Parallels tools to 11.1.2

## 2.0.10 (2015-12-30)

* Add SELinux dependencies for 5.x & 6.x

## 2.0.9 (2015-11-21)

* Add CentOS 7.2 templates
* Upgrade Docker to 1.9.1
* Upgrade VMware tools to 10.0.5 for VMware Fusion 8.1.0
* Upgrade Parallels tools to 11.1.1

## 2.0.8 (2015-11-19)

* Upgrade Parallels tools to 11.1.0
* Upgrade Docker to 1.9.0

## 2.0.7 (2015-11-12)

* Upgrade VirtualBox guest additions to version 5.0.10

## 2.0.6 (2015-11-01)

* Upgrade VMware tools to 10.0.1 for VMware Fusion 8.0.2
* Upgrade VirtualBox guest additions to version 5.0.8
* Port improvements in structure/build parallelism from Ubuntu templates

## 2.0.5 (2015-10-07)

* Upgrade VirtualBox guest additions to version 5.0.6
* Add an motd banner

## 2.0.4 (2015-09-30)

* Upgrade VirtualBox guest additions to 5.0.4
* Install Docker from the official get.docker.com package repo
* Remove Parallels provider

## 2.0.3 (2015-08-27)

* Upgrade VMware tools to 10.0.0 for VMware Fusion 8
* Upgrae Parallels tools to 11.0.0

## 2.0.2 (2015-08-15)

* Add CentOS 6.7 templates
* Upgrade VirtualBox guest additions to 5.0.2

## 2.0.1 (2015-07-30)

* Upgrade Parallels tools to 10.2.2

## 2.0.0 (2015-07-22)

* Upgrade VirtualBox guest additions to 5.0.0

## 1.0.17 (2015-06-20)

* Make selinux permissive by default
* Upgrade VMware tools to 9.9.3 for VMware Fusion 7.1.2
* Increase lazy-allocated disk size for server images to 64GB
* Increase lazy-allocated disk size for desktop images to 127GB

## 1.0.16 (2015-06-04)

* Upgrade VirtualBox guest additions to 4.3.28
* Upgrade Parallels tools to 10.2.1

## 1.0.15 (2015-04-09)

* Add CentOS 7.1 templates
* Upgrade Parallels tools to 10.2.0

## 1.0.14 (2015-03-22)

* Upgrade VirtualBox Guest Additions to 4.3.26

## 1.0.13 (2015-03-09)

* Upgrade VirtualBox Guest Additions to 4.3.24
* Fix issues with SELinux not always being disabled

## 1.0.12 (2015-02-26)

* Use the SATA HDD controller for faster disk IO speeds on VirtualBox
* Rely on the vendor-supplied ca-bundle.crt that comes with the openssl package

## 1.0.11 (2015-02-22)

* Upgrade VirtualBox Guest Additions to 4.3.22
* Upgrade VMware Tools to 9.9.2 for VMware Fusion 7.1.1
* Upgrade Parallels Tools to 10.1.4

## 1.0.9 (2014-12-29)

* Upgrade Parallels Tools to 10.1.2
* Upgrade Docker to 1.3.2
* Default timezone now UTC

## 1.0.8 (2014-12-06)

* Upgrade VMware Tools to 9.9.0 for VMware Fusion 7.1.0
* Remove unnecessary iwl-firmware packages on CentOS 7

## 1.0.7 (2014-11-28)

* Upgrade VirtualBox Guest Additions to 4.3.20
* Upgrade Docker to 1.3.1 on CentOS 6
* Upgrade Docker to 1.2.0 on CentOS 7

## 1.0.6 (2014-11-02)

* Corrected commenting out of requiretty
* Upgrade VMware Tools to 9.8.4 for VMware Fusion 7.0.1
* Added Parallels 10.1.1 boxes to build

## 1.0.5 (2014-10-17)

* Upgrade VirtualBox Guest Additions to 4.3.18

## 1.0.4 (2014-09-29)

* Added templates for CentOS 5.11

## 1.0.3 (2014-09-21)

* Upgraded VirtualBox Guest Additions to 4.3.16
* Version information now appended to box file name

## 1.0.2 (2014-09-04)

* Upgraded VMware Tools to 9.8.3 for VMware Fusion 7
* Added Docker images
* Added 3D acceleration to Desktop images

## 1.0.1 (2014-07-31)

* Added CentOS 7.0 support
* Made templates more proxy friendly
* Added headless option
* Added option to run "yum -y update"

## 1.0.0 (2014-05-09)

* Initial commit
