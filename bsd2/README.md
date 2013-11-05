Eventually, we may provision multiple "distributions," but we need to scope our
first offering. @jackspaceBerkeley previously created 
[a proposal](https://docs.google.com/a/berkeley.edu/document/d/1l8zvoJMKhfr4of7F8fwcDsIBoizCLr9lofKpE4EXbJw/edit)
for this, and more recently, Philip Stark (Stats chair) suggested that he was
interested in this. 

This will be a collaboration with folks like @aculich, @fperez,
@BagOfMostlyWater, @paciorek, and Josh Bloom. Here, I'll summarize what others
have requested. I'll offer my own input in a comment below.

And suggested the following basic requirements (edited by me):

- a linux distro (which should include things like gcj, gcc, g95; a
  standards-compliant browser that supports HTML5 and MathML; a webserver; ps
and pdf viewers; ...)
- Docker / LXC (virtualization)
- git with a gui (+ git annex assistant & gitlabhq)
- python, IPython, and a good set of scientific libraries, starting with:
  - numpy
  - scipy
  - matplotlib
  - pandas
  - cython
  - possibly scikit learn
  - statsmodels + patsy (philip may not know about these, he said "when a stats
    lib exists")
- R with a good set of libraries
  - (Chris should weigh in on this)
- an SQL database that's moderately heavy duty (SQLite probably won't suffice)
  - Philip asked for mySQL or MariaDB, but Postgres seems like the best choice
    to @davclark
- support for something like Hadoop / gen. distributed computing
- a few good text editors
- a TeX/LaTeX distribution with an assortment of guis, packages, and fonts;
  BibTeX with an assortment of style files, including AMS, APA, others? (def.
include LuaTeX)
- some viable variant of OpenOffice
- Test suites?

@aculich pointed us at https://github.com/amplab/docker

Ryan added the following:

Optimized BLAS (OpenBLAS, ACML, etc.), configurable (e.g. Debian alternatives);

gcc, clang;

SQLite;

Commercial software?
 - Cannot distribute via models like PPAs/NeuroDebian
 - license management
 - Econometricians and some statisticians want Matlab
 - intel compilers

Most everything in Philip's list is already packaged in Debian/Ubuntu. How much
demand is there for packaging of upstream releases? (especially Python and R
libraries which evolve much faster)

Extra: Log app and package utilization. e.g. SCF logs R library loading to know
what people are really using. Use to refine the software stack.

I think we should source solid PPAs for recent versions of scientific software.
E.g.:

For R: https://launchpad.net/~marutter/+archive/c2d4u (appears to have replaced 
https://launchpad.net/~marutter/+archive/rrutter)

For python: [NeuroDebian](http://neuro.debian.net/) is likely the best source to
get recent, but stable versions of scientific packages.

We should also install recent versions of scala and JavaScript, though I'm not
as familiar with these stacks.

Thinking about whether we should include something like the Continuum anaconda
python distribution. It would be nice (e.g., compiled with Intel MKL), but it is
not free.

More generally, we should be sensitive to installing performant linear algebra
libraries, as they can vary widely in performance!