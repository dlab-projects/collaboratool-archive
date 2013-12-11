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
* This gets you the minimal container needed to run IPython Notebook, from index.docker.io (needs hi-speed net conn)
* Execute docker-run-learnds-vagrant.sh ifrom /vagrant inside the VM - this runs a docker container inside the VM.
* Test it by running 'curl http://localhost:8888' inside the VM - you should get an HTML page (the ipynb home page)
* Now start a separate terminal shell on your host machine (laptop, desktop)
* From this terminal log in to the VM using ssh port redirection via
vagrant ssh -- -L:8888:localhost:8888  Note the '--' followed by a '-' with intervening space.
* This maps the VM port 8888 to the host machine port 8888
* Now on your laptop (host machine),  point your web browser to "http:localhost:8888/" you should see the IPython Notebook home page with the test content.

This is for docker on a bare linux environment
------
* This assumes docker has been installed on your Linux box.
* If not install it from docker.io for the appropriate Linux -  
e.g. for Ubuntu see

http://docs.docker.io/en/latest/installation/ubuntulinux/

* Pull a publicly available container (you can replace this one with your own when you have the rest working).
* Execute 'docker pull nitin/learn_data_science' .
* This gets you a minimal container with IPython from index.docker.io (needs hi-speed net conn)
* Execute 'docker-run-learnds-linux.sh' at a shell prompt. This start the container which launches an IPython Notebook process
* Test it by running 'curl http://localhost:8888' at the OS prompt - you should get an HTML page (the ipynb home page)
* Now from an external terminal ssh into your linux box, redirecting ports as follows
* ssh -L:8888:localhost:8888 - this maps port 8888 on your laptop to port 8888 on the Linux box
* Now on your laptop, point your web browser to "http:localhost:8888/" you should see the IPython Notebook home page.
