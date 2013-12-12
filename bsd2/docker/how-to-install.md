This is for a docker environment inside a Vagrant VM
------

* install docker - if necessary Vagrant+Docker if on (Mac or Win)
* for e.g. Mac it will involve cloning a git repo as suggested on docker.io's instructions at  

http://docs.docker.io/en/latest/installation/vagrant/

 then doing a "vagrant up" which uses the Vagrantfile which comes with the 'docker' git repo.  
* Now you have a docker environment inside an Ubuntu 12.04 LTS 64 bit VM managed by Vagrant.
* the 'vagrant up' command started the VM.
* connect to it by executing 'vagrant ssh' from the Mac shell prompt.
* Now we will pull a publicly available container (you can replace this one with your own when you have the rest working) containing IPython ready to run.
* Now at the shell prompt  inside the Vagrant VM execute 'docker pull nitin/learn_data_science' .
<<<<<<< HEAD
* This gets you the minimal environment needed to run IPython Notebook, from index.docker.io (needs hi-speed net conn)
* Now get the test notebook content into a local file system from nborwankar/LearnDataScience git repo
* Read comments under issue #31 and understand the details of the -v, and -w flags for mounting volumes and setting working directories as a part of 'docker run'
* Map your LearnDataScience directory location to a container volume, noting the need to mount the parent dir of 'notebooks' and not the notebooks dir itself as it has siblings it uses.
* Use command line in issue #31 with your customization applied i.e. using the right directories for your LearnDataScience
* Now execute your 'docker run ... -v ....-w ....' command line inside your Vagrant VM - this starts an iPython notebook process at port 8888 inside the VM.
* Test it by running 'curl http://localhost:8888 - you should get an HTML page (the ipynb home page)
=======
* This gets you the minimal container needed to run IPython Notebook, from index.docker.io (needs hi-speed net conn)
* Execute docker-run-learnds-vagrant.sh ifrom /vagrant inside the VM - this runs a docker container inside the VM.
* Test it by running 'curl http://localhost:8888' inside the VM - you should get an HTML page (the ipynb home page)
* This gets you a container with IPython from index.docker.io (needs hi-speed net conn)
* Now get the test notebook content into a local file system from nborwankar/LearnDataScience git repo
* Read comments under issue #31 and understand the details
Map your LearnDataScience directory location to a container volume, noting the need to mount the parent dir of 'notebooks' and not the notebooks dir itself as it has siblings it uses.
Use command line in issue #31 with your customization applied i.e. using the right directories
Now execute your command line at the shell prompt - this starts an iPython notebook process at port 8888 inside the container maped to port 8888 on the host.

Test it by running 'curl http://localhost:8888 - you should get an HTML page (the ipynb home page)
Now from an external terminal ssh into your linux box, redirecting ports as follows
ssh -L:8888:localhost:8888 - this maps port 8888 on your laptop to port 8888 on the Linux box

Now on your laptop, point your web browser to "http:localhost:8888/" you should see the IPython Notebook home page.
=======
* This gets you a minimal container with IPython from index.docker.io (needs hi-speed net conn)
* Execute 'docker-run-learnds-linux.sh' at a shell prompt. This start the container which launches an IPython Notebook process
* Test it by running 'curl http://localhost:8888' at the OS prompt - you should get an HTML page (the ipynb home page)
* Now from an external terminal ssh into your linux box, redirecting ports as follows
* ssh -L:8888:localhost:8888 - this maps port 8888 on your laptop to port 8888 on the Linux box
* Now on your laptop, point your web browser to "http:localhost:8888/" you should see the IPython Notebook home page.
