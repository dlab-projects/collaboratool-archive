#!/bin/bash

echo "BCE: Installing build utilities..."
#apt-get -y install build-essential dkms xserver-xorg dmidecode && \
apt-get -y install xserver-xorg && \
echo DONE || echo FAIL

# Automate VBox guest additions by downloading the ISO from virtualbox.org.
# An alternative method would be to manually share the directory on the host
# which actually contains VBoxGuestAdditions.iso. On a Mac that is
# /Applications/VirtualBox.app/Contents/MacOS/. Just like with the host user's
# home directory however, there's no convenient variable representing this
# location within the Shared Folders configuration.
echo "BCE: Installing Guest Additions..."
(
	V=$(dmidecode | grep vboxVer | sed -e 's/.*_//')
	if [ -z "${V}" ]; then
		V=$(modinfo vboxguest | grep ^version | sed -e 's/.* //' -e 's/_.*//')
	fi

	ISO=VBoxGuestAdditions_${V}.iso
	ISO_URL=http://download.virtualbox.org/virtualbox/${V}/${ISO}
	wget -O /tmp/${ISO} ${ISO_URL} && \
	mount -o loop,ro /tmp/${ISO} /mnt && \
	/mnt/VBoxLinuxAdditions.run -- --force && \
	umount /mnt && rm /tmp/${ISO} && \
	true
) && \
echo DONE || echo FAIL

# CRAN repo
# There is no 14.04 CRAN archive yet so it is commented out
#apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 && \
#echo "#deb http://cran.cnr.berkeley.edu/bin/linux/ubuntu trusty/" > \
#	/etc/apt/sources.list.d/cran.list && \
# Prefer rrutter and c2d4u PPAs
echo "BCE: Installing R PPAs..."
add-apt-repository -y ppa:marutter/rrutter && \
add-apt-repository -y ppa:marutter/c2d4u && \
echo DONE || echo FAIL

echo "BCE: Updating OS..."
apt-get update && \
DEBIAN_PRIORITY=high DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade && \
echo DONE || echo FAIL

# Packages
# rabbitvcs pulls in Ubuntu ipython which we displace later with pip
echo "BCE: Installing selective packages..."
apt-get -y install git sqlite3 pandoc emacs xemacs21 default-jre default-jdk \
	r-recommended libjpeg62 fonts-mathjax python-software-properties \
	python-dev python-pip python-setuptools python-pip python-gtk2-dev \
	texlive{,-latex-{base,extra},-fonts-{extra,recommended},-pictures} \
	gedit{,{,-developer}-plugins,-{r,latex,source-code-browser}-plugin} \
	rabbitvcs-gedit thunar-vcs-plugin \
	firefox xpdf evince gv libreoffice \
	libyaml-dev libzmq3-dev libssl-dev libxslt1-dev liblzma-dev \
	lightdm xrdp xfce4{,-terminal} xubuntu-default-settings && \
echo DONE || echo FAIL

# Google Chrome
echo "BCE: Installing google chrome..."
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > \
	/etc/apt/sources.list.d/google-chrome.list && \
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | \
	apt-key add - && \
apt-get update > /dev/null && \
apt-get -y install google-chrome-stable && \
echo DONE || echo FAIL

# R, RStudio
echo "BCE: Installing RStudio..."
wget http://www.stat.berkeley.edu/~ryan/cloud/getrstudio && \
RSTUDIO_URL=`python getrstudio -32` && \
wget ${RSTUDIO_URL} && \
dpkg -i $(basename ${RSTUDIO_URL}) && \
echo DONE || echo FAIL

# < = requires package ; > = pulls in
# boilerpipe < default-jre default-jdk
# boilerpipe > JPype1 charade
# rpy2 < liblzma-dev
# pyyaml < libyaml-dev
# pandas > dateutil pytz numpy
# ipython > tornado pyparsing nose backports.ssl-match-hostname 
# sphinx > Pygments docutils Jinja2 markupsafe
# scrapy > Twisted w3lib queuelib cssselect
# scrapy < libxslt1-dev libssl-dev
# flask > Werkzeug itsdangerous
# ipythonblocks < ez_setup
# seaborn < patsy
# seaborn > husl moss statsmodels
# ipython notebook < pyzmq libzmq3-dev
# apt-get installing python-gtk2-dev is much faster than pip-installing gtk2

# rpy2 20140409: Requires this patch to build. Waiting on next release.
# https://bitbucket.org/bioinformed/rpy2/commits/c1c9ddf2910cfb68fe56ee4891ed6785a0b8352b

echo "BCE: Installing Python modules..."
for p in pandas matplotlib scipy rpy2 ipython sphinx scrapy \
	distribute virtualenv apiclient BeautifulSoup boilerpipe bson \
	cluster envoy feedparser flask geopy networkx oauth2 prettytable \
	pygithub pymongo readline requests twitter twitter-text-py \
	uritemplate google-api-python-client jinja facebook nltk ez_setup \
	ipythonblocks scikits.learn sklearn-pandas patsy seaborn pyzmq markdown \
	git+git://github.com/getpelican/pelican.git@011cd50e2e7 ghp-import; do \

	printf "%20s =========================================\n" "${p}"
	pip install --upgrade "${p}" 2>/tmp/pip-err-${p}.log | \
		tee /tmp/pip-out-${p}.log
done

# Configure desktop
update-alternatives --set x-session-manager /usr/bin/xfce4-session

# Automatically login oski at boot
printf "[SeatDefaults]\nautologin-user=oski\nautologin-user-timeout=0\n" >> \
	/etc/lightdm/lightdm.conf.d/20-BCE.conf
#/usr/lib/lightdm/lightdm-set-defaults --autologin oski

# Hide boot messages
sed -i \
	-e '/GRUB_HIDDEN_TIMEOUT=/s/^#//' \
	-e '/^GRUB_CMDLINE_LINUX_DEFAULT=""/s/""/"quiet splash"/' \
	/etc/default/grub


printf "%%sudo\tALL=(ALL:ALL) NOPASSWD: ALL\n" > /etc/sudoers.d/nopasswd

# Create oski
adduser --gecos "" --disabled-password oski && echo oski:oski | chpasswd 
# Enable oski to sudo without a password
adduser oski sudo
# Enable oski to mount shared folders
adduser oski vboxsf
# Enable oski to login without a password
adduser oski nopasswdlogin

# Set a 4-space tabstop for nano
sed -i -e '/# set tabsize 8/s/.*/set tabsize 4/' /etc/nanorc

# Clean up the image before we export it
apt-get clean


# Create a convenient place on the desktop for people to mount
# their Shared Directories.
(
	cd /home/oski
	sudo -u oski mkdir Desktop
	cd /home/oski/Desktop
	sudo -u oski ln -s /media Shared
)

# Not included here:
# - change desktop background from image to solid color
# - panel launcher for terminal, file manager, browser, gedit
# - remove desktop icon for Trash, File System; leave Home
# - change Application Menu widget to use a generic computer icon from whatever
#   it is that XFCE uses.
# - Benoit prefers black-on-white terminal; easier to see on projectors
################################################################################
