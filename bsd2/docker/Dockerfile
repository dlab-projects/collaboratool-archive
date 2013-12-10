FROM parente/ipython-notebook

# EXPOSE doesn't seem to work with a bare port (8888) or the following
# EXPOSE 127.0.0.1:8888:8888
EXPOSE 8888
# I'm not sure if these directives will work
# nitin: I am commenting these out for now as
# a) they will cause the dir mapping to fail in a non vagrant context
# b) they force dir names and mount points on a user who runs the container
# c) they need the LearnDataScience repo to be cloned inside the docker directory which hasnt been done yet (I will do that part)
#VOLUME /vagrant/content/LearnDataScience:/LearnDataScience
#WORKDIR /LearnDataScience/notebooks

# The first CMD line belowi was commented out as it  did not work when the container was built from this file
# there appear to be some importance to the --MappingKernelManager settings, without them IPyNB starts but the kernel
# keeps dying and cannot be restarted - these settings are from the Dockerfile for michaelcrosby/ipython which is a precursor
# to parente/ipython-notebook 
#CMD ["ipython", "notebook", "--no-browser", "--ip=*"]
CMD ["ipython", "notebook", "--pylab=inline", "--ip=*", "--MappingKernelManager.time_to_dead=10", "--MappingKernelManager.first_beat=3"]
