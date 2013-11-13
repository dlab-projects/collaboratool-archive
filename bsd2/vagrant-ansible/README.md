This is an initial stab at setting up a VM with vagrant and ansible. It requires
python on the machine running vagrant, but it's not really intended as an
end-user setup - vagrant can be used to make the end result VM available to
"regular" users.

Additional dependencies:

Linux hosts
===========
vagrant; 1.0.3 is not sufficient, 1.3.5 is.
python-yaml
python-jinja2
