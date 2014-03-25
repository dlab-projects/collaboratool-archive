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

(Installing in aptitude for now) - gedit rabbitvcs-gedit thunar thunar-vcs-plugin
xfce4 firefox nano git xfce4-goodies (a little heavy)

Need to set up nano to do proper 4-space indentation on tab, likewise set up
gedit for good python editing w/ code highlighting, etc.

To start GUI, run startxfce4

Somehow, IPython (0.13) got installed - so need to uninstall

Also - icons don't work for Thunar :(

The above already has things at 2.3 GB!

Full Xubuntu is smaller than Lubuntu (odd!)

Target for Summer 2014
======================

Dav and Ryan identified the following specifications for the summer VM:

	- OS: Ubuntu Server 14.04 (32-bit)
		+ Python packages should be installed via pip/easy_install since it is likely they will need to be upgraded mid-term while the Ubuntu python-* packages do not change.
		+ R packages should come from rrutter and c2d4u PPAs since they are kept up-to-date while the Ubuntu r-cran-* packages do not change.
	- User: Single auto-login user ("oski") with no password sudo.
	- VirtualBox: Window should be resizable.
		+ (not discussed yet) bidirectional clipboard enabled
		+ (not discussed yet) host to guest drag-n-drop enabled
	- Desktop: XFCE
		+ One panel with launchers for Terminal, Browser, File Manager, Text Editor
		+ Substitute solid color for background image
		+ Remove desktop icon for Trash and File System. Leave Home icon.
		+ (not discussed yet) Benoit and Ryan suggest an icon on the desktop pointing to /media, VirtualBox's parent of all Shared Folders.
		+ (not discussed yet) Benoit prefers black-on-white text in terminal since it is easier to see when projected in class
		+ (not discussed yet) Ryan prefers to change the panel's Application menu icon to a generic computer icon from XFCE's logo.

Undecided
	- Ryan prefers to hide the grub menu and Linux kernel boot messages. This doesn't fit in with the "glass brick" model where we don't hide the plumbing.

Future Tasks
	- Investigate box file format to reduce size
