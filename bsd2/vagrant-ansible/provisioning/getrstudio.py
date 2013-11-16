#!/usr/bin/python
#
# RStudio does not provide a "-latest" download link so we deduce it from
# their S3 bucket listing and save the download to /tmp/rstudio-latest.deb.
#
# Test this script by running:
# wget -O /tmp/somefile.xml http://download1.rstudio.org
# python thisscript.py /tmp/somefile.xml

import sys
import urllib
import xml.etree.ElementTree as ET

# There's also download2
RSTUDIO_MIRROR = 'http://download1.rstudio.org'
DEST = '/tmp/rstudio-latest.deb'

# Debugging; save output from RSTUDIO_MIRROR to a file then specify the
# path to the file as first argument
DEBUG = len(sys.argv) > 1

if DEBUG:
	f = open(sys.argv[1])
else:
	f = urllib.urlopen(RSTUDIO_MIRROR)

# S3 bucket; http://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketGET.html
root = ET.parse(f).getroot()
# {http://s3.amazonaws.com/doc/2006-03-01/}
namespace = root.tag.split('ListBucketResult')[0]

latest = ''

for child in root:
	try: filename = child.find(namespace + 'Key').text
	except: continue

	# Filename comparison relies on rstudio's stable naming convention
	if filename.endswith('amd64.deb') and filename > latest: latest = filename

if DEBUG:
	print RSTUDIO_MIRROR + '/' + latest
else:
	dl = urllib.urlretrieve(RSTUDIO_MIRROR + '/' + latest, DEST)
