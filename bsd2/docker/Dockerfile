FROM parente/ipython-notebook

# EXPOSE doesn't seem to work with a bare port (8888) or the following
# EXPOSE 127.0.0.1:8888:8888
EXPOSE 8888
# davclark: I'm not sure if these directives will work

# nborwankar: I am commenting these out for now as
# a) they will cause the dir mapping to fail in a non vagrant context
# b) they force dir names and mount points on a user who runs the container
# c) providing these in the shell scripts run-learnds-linux.sh and run
# VOLUME /vagrant/content/LearnDataScience:/LearnDataScience
# WORKDIR /LearnDataScience/notebooks





# nborwankar:
# The CMD line below was commented out as it did not work when the container was built from this file
# While the syntax CMD["executable", "param","param"....] is recommended it is not working in this context.
# The kernel keeps dying and cannot be restarted. 
# CMD ["ipython", "notebook", "--no-browser", "--ip=*"]

# The following line is taken from the Dockerfile used to build crosbymichael/ipython which is a precursor to parente/ipython-notebook
CMD ipython notebook --pylab=inline --ip=* --no-browser --MappingKernelManager.time_to_dead=10 --MappingKernelManager.first_beat=3
