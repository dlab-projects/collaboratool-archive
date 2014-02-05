Collaboratool Base Image Generation
===================================

The safest base image appears to be the vanilla 32-bit ubuntu server image. This
could in theory be set up with Packer, but it's very fast to create manually, at
which point you can readily create an OVA file (preferred over OVF, which is
multiple files).

For now, I've created a v1.0 OVF file immediately after verifying the ubuntu
server VM booted in VirtualBox. Additionally, in this directory, you'll see some
debian installer settings. They aren't quite perfect but probably good enough.
Likewise, there's a packer template that might serve to boostrap the base
template. But this brings me to...

Don't automate when it's a PITA
===============================

Figuring out the right settings for the debian installer, etc. is a PITA. So, we
want to do a minimal install. Sadly, as of Packer 0.5.1, starting with an OVA
doesn't support even mounting the guest extensions, so in addition to doing the
vanilla install (including an OpenSSH server), we do the following. It's
something we only need to do once to get to the base image, and is pretty few
steps:


    apt-get install dkms xserver-xorg
    # Maybe do all updates?
    # Manually mount the Guest Extensions, "insert" using the VBox GUI
    sudo mount /dev/cdrom /mnt
    sudo /mnt/VBoxLinuxAdditions.run

Then just save this as our "Collaboratool Base32" OVA, again using the
VirtualBox GUI.

These are packages I'm playing around with as a minimal common interface
========================================================================

(Installing in aptitude) - gedit, rabbitvcs-gedit, thunar, thunar-vcs-plugin,
xfce4, firefox, nano

Need to set up nano to do proper 4-space indentation on tab, likewise set up
gedit for good python editing w/ code highlighting, etc.

To start GUI, run xfce4-session

Somehow, IPython (0.13) got installed - so need to uninstall

The above already has things at 2.3 GB!


