8 Nov 2013
----------

In attendance: @aculich, @BagOfMostlyWater, @davclark, @jackspaceberkeley,
@sbenthall

## Situating the Project

@sbenthal: How is this getting recorded, communicated? Where is it situated?

@davclark is working on collaboratool.berkeley.edu to enable a web presence, we
should set up a google group.

AMP lab is working on Docker / Puppet approaches here:

    https://github.com/amplab/docker-scripts

The various projects for virtualizing python notebooks are enumerated in the
README.md in the root of the collaboratool project.

@aculich is concerned about distributing the work effectively. He is currently
working on coordinating these things. In particular, he's working with Mozilla
on persona, and has a meeting soon on CalNet auth.

We need to spec out our plan / steps.

We can create a project plan in GitHub or document. An initial concern is Dec 12
Data Science Faire.

A major concern is for all players to be aware of each other going in. @aculich
thinks we should minimize what we do specifically for the data faire.

@davclark mentions Harrison's Data Lab.

Evans houses numerous spaces for SCF - undergrad & grad lounges, a cluster, etc.
This is distinct from the space currently held by ETS that may be deployed as a
kind of D-Lab North.

5 Nov 2013
----------

In attendance: @aculich, @BagOfMostlyWater, @davclark, @paciorek, Patrick
Schmidt

### Shared services campus-wide

Some of us had never heard of "Research IT" strategy (i.e., condo model) prior
to Data Science reception.  Only people who "knew somebody who knew somebody"
found their way to the reception, and still don't know about this.

Campus-wide ticketing system: ???

 - Docker meetup next Wednesday / Thursday
 - AMPLab is working closely with Docker
 - AMPLab is hiring a build-guy
 - UC-wide Puppet is getting standardized, including campus-wide agreement

### What is the D-Lab

 - Training
 - Tools
 - Culture

A new thing Patrick suggested about our "Brand" -- what are we known for? If you
ask us a question, it's going to get answered.

(In relation to Social Science Matrix, which is more focused on the top-down
part of the hierarchy -- faculty, seminars, grants, research.)

### What is the Statistical Computing Facility's (SCF's) role

Ryan has mentioned POST a number of times as similar to Puppet / Ansible.
(By post, we just mean that we have a set of scripts to tailor Ubuntu 12.04
for our needs in Statistics - post = "post-install").

Philip Stark implied "Fernando's group" is doing something. Make sure SCF needs
are fulfilled by "that."

### AMP Lab

Not represented at this meeting, but doing an enormous amount of work on the
issue of provisioning and configuration.

### BIDS (& IPython dev team)

They are NOT working on this. Fernando is highly suspicious of virtualization.

## Take Homes

Provisioning and configuration should be maintained as separable concerns.

Patrick: User model / story & technical solution must be separate things.

While saved images are useful for performance (and potentially robustness), we
should strive to maintain "recipies" to build these images.

### Provisioning

At a minimum for now, need to run on your local computer, and put up on commodity
providers like EC2 & DigitalOcean.

### Configuration

SCF already has an initiative putting together a set of libraries and resources
that folks need.
