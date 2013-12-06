This is an initial attempt at tool to set up a VM with vagrant and ansible. It
is not really intended for end-users who will most like make use of the end
results, for example, a VirtualBox disk image.

Ansible is run within the Ubuntu 12.04 guest OS from a vagrant shell
provisioner.

All Host Platforms
==================
Vagrant, [http://downloads.vagrantup.com](http://downloads.vagrantup.com)
1.0.3 is not sufficient, 1.3.5 is.

VirtualBox, [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)

Additional host dependencies:

Windows
=======
Git, [http://git-scm.com/download/](http://git-scm.com/download/)
Git provides a bash shell with which one can check out collaboratool code,
but also run vagrant commands. Without git, a user can manually download collaboratool code from github
