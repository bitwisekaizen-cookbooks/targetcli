# targetcli Chef Cookbook

This cookbook fetches the latest [targetcli](http://linux-iscsi.org/wiki/Targetcli) code from the [Datera git
repositories](https://github.com/datera/), builds it and installs it on Ubuntu.  The targetcli utility is the general
 management utility for [Linux-IO Target](http://linux-iscsi.org/wiki/LIO) (also known as LIO).

To use with [Vagrant](http://vagrantup.com), you must first install Vagrant as well as the [ChefDK](https://downloads
.chef.io/chef-dk) and the [vagrant-berkshelf Vagrant plugin](https://github.com/berkshelf/vagrant-berkshelf).  Then,
simply clone this repository and run `vagrant up`.

This cookbook is accompanied by [Serverspec](http://serverspec.org) tests which can be run through [Test Kitchen]
(http://kitchen.ci). To run these tests, simply clone this repository and run `kitchen test`.  Note that Vagrant
is required to run Serverspec tests.

Enjoy!
