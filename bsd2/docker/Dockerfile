FROM parente/ipython-notebook

# EXPOSE doesn't seem to work with a bare port (8888) or the following
# EXPOSE 127.0.0.1:8888:8888
# I'm not sure if these directives will work
VOLUME /vagrant/content/LearnDataScience:/LearnDataScience
WORKDIR /LearnDataScience/notebooks

CMD ["ipython", "notebook", "--no-browser", "--ip=*"]
