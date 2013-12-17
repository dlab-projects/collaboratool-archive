## Environment used

I use notebooks and content at learnds.com as a test suite as it has sufficient
complexity to take this beyond toy examples.  In my set up the IPy Notebook dir
has datasets, and images as siblings to the notebook dir so we really need a
parent (LearnDataScience) to we get the full context to run notebooks. Here's
how it goes.

I have used the git docker repo that docker.io says to use to start a Vagrant +
Docker environment on a Mac.  Inside the docker repo I created a ../content/ dir
in which I cp -r'ed my LearnDataScience dir tree.

In my set up the notebook dir has datasets, and images as siblings so we really
need a parent (LearnDataScience) so we get the full context to run notebooks.
Here's how it goes.

## Command flags

docker run has three relevant flags

-v for volume mount
-w working directory for running software
-p port mapping

`docker run -v '/vagrant/content/LearnDataScience/notebooks:/notebooks' -w '/notebooks' -p 127.0.0.1:8888:8888 <docker image name>`

`-v 'host_directory:container_mount_point'`:

here we are mounting `/vagrant/content/LearnDataScience/notebooks` as seen on
the VM as /notebooks in the container. Note that this is really
`<gitrepo>/docker/content/LearnDataScience/notebooks` on my Mac. 

`-w <working dir>`:
says here use the '/notebooks' dir as dir in which to start ipynb

`-p localhost:hostport:containerport`: 

Note that container port needs to have an EXPOSE statement in the Dockerfile or
an equivalent instruction in build  that exposes that port from the container to
the outside world. If we dont have that this flag will be accepted but won't do
what we want.  This line maps the exposed port to a port in the host context. We
just keep it at 8888.

(Other ports such as 80, 443, 22 etc are typically exposed for web servers, sshd
etc.)

Most importantly - the Dockerfile or the build script doesn't force the host to
accept a particular binding and leaves the decision to runtime considerations -
this is beautiful separation of concerns - the docker team made some breaking
changes in 0.6 to deprecate the ability to put a host mapping inside the
Dockerfile (a bad thing).

The actual values of these flags can be made configurable via a wrapper shell
script plus a Yaml or Json or .ini config file etc - so now we are in 'edit text
to customise' land and away from having to build a container just to remap.

Now we are left mainly with packaging plus showing notebook editing/sharing - we
have my content which makes for a rich demo and we have something running end to
end.

Will validate on dlab and on DigOcean in next day or two.

I was able to see my LearnDataScience notebooks from my laptop port 8888 via
IPyNB in a container on a Vagrant VM mounting the files from
Mac->VagrantVM->Container.

Currently a vagrant ssh -L 8888:localhost:8888 is needed for the last mile.

This is for the case of an intervening VM - I am not quite sure how to eliminate
that yet - I think it needs Vagrantfile voodoo that Dave and Ryan possess so I
am not worrying about that yet.  I will look at it tonight and probably
eliminate that if possible.

I am focusing next on 

a. setting up DigOcean server similarly
b. testing git push pull for notebook sharing
c. documenting 

If possible

d. putting a full Virtualbox + Vagrant + docker environment on an external USB
   drive (potentially a thumb drive but first just any external drive) for
   portability.  I will assume a Mac as usb drive recipient for now - in future
   wpe can have Win/Mac/Linux all on there.

That may happen early next week but probably not tomorrow.  It's a stretch goal
for now just for the timelines.
