Collaboratool
=============

"Collaboratool" is a project for building, integrating, and deploying tools that
support portable, reproducible data science. It is currently a collaboration
between folks at UC Berkeley in the [D-Lab](http://dlab.berkeley.edu),
[EECS](http://eecs.berkeley.edu), [Statistics](http://statistics.berkeley.edu),
and [the iSchool](http://ischool.berkeley.edu).

We got started with thinking about how to deploy virtualized containers that
provide things like IPython notebooks through the web. We were very inspired by 
[jiffylab](http://github.com/ptone/jiffylab). We will likely include some
variant of this project in the collaboratool suite (or "shed" as we like to call
it). 

Currently, the bsd2 directory contains work towards a "Berkeley Standard Data
Science Distribution."

Shortly, we'll be putting up a website using github pages, and some of this info
will migrate there. Stay tuned. For now, here are some lists:

Virtualized IPython notebooks:

 - [jiffylab](http://github.com/ptone/jiffylab) was the first project we saw
   that did this. It relies on [Docker](http://docker.io) as a primary enabling
   technology.
 - [ipydra](https://github.com/UnataInc/ipydra) is the current home of work
   begun in [ipython-hydra](https://github.com/cni/ipython-hydra). It doesn't
   appear to use the same level of virtualization
 - [ipython-dokku](https://github.com/richstoner/ipython-dokku), perhaps
   unsurprisingly, uses [dokku](https://github.com/progrium/dokku) to achieve similar things.
   [SimpliPy](http://simplipy.org/) uses this to deploy to 
   [Digital Ocean](https://www.digitalocean.com/).
 - [notebookcloud](https://notebookcloud.appspot.com/docs) does something
   similar, but is restricted to EC2.
 - [Continuum Wakari](http://wakari.io) and [picloud](http://picloud.com) offer
   proprietary solutions, though both provide for a certain amount of
   customization. Last time Dav checked, Waraki customization was more limited
   and less reliable than picloud (though it requires less admin knowledge).

Similarly, [RStudio Server](RStudio Server) runs through a web interface as
well, but we have yet to identify a solution like jiffylab or the others above.
