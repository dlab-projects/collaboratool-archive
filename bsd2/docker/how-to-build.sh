It may be necessary to build a container, rarely, probably not for this installation, but in future.
'docker build' is a powerful and complex instruction with many flags/features.
Here we use the simplest combination, to create a docker container from a Dockerfile and the contents of the current directory.
To see the full documentation of the 'docker build' instruction see the Docker Command Line Help at http://docs.docker.io/en/latest/commandline/cli/.
For our purposes just run docker-build-learnds.sh in-place to regenerate the nitin/learn_data_science image - this should NOT be needed unless that image is corrupted.

To customise the container you may need to edit the Dockerfile and rebuild.  In that case please do the docker.io Dockerfile tutorial
http://www.docker.io/learn/dockerfile/ at the least.


