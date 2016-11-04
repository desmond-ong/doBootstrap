# doBootstrap
-----------
update 2016-11-06: I just chanced across a sequence of blogposts [one](http://sumsar.net/blog/2015/04/the-non-parametric-bootstrap-as-a-bayesian-model/), [two](http://www.sumsar.net/blog/2015/07/easy-bayesian-bootstrap-in-r/), and [three](http://www.sumsar.net/blog/2016/02/bayesboot-an-r-package/) detailing Bayesian and classical non-parametric bootstrap, and detailing a package ('bayesboot', on CRAN) for Bayesian bootstrapping. I haven't checked it out yet. (My implmentation below is a simple, "classical" non-parametric bootstrap.)


-----------
This repository contains some basic functions, written in R, to bootstrap effect sizes and confidence intervals for descriptive statistics, regressions, etc.

- [doBootstrapPrimer.pdf] (../../raw/master/doBootstrapPrimer.pdf) : contains a primer on bootstrapping.
- doBootstrapReadme.R : contains a few examples for using doBootstrap.R
- doBootstrap.R : code.

The code is slow as I have not optimized/did not use R's optimized boot functions. That will hopefully be fixed in a future version.



### Currently doBootstrap supports:
- Single-sample descriptive statistics: mean
- Two-sample descriptive statistics: correlations, differences (paired and unpaired), cohen's d (paired and unpaired)
- (Simple) Mediation (using code written by Benoit Monin)
- Custom written functions (or others that are not specified, e.g. median)
- Fixed effect multiple linear regression (using lm)
- Mixed effect multiple linear regression (using lme4::lmer)



### On the todo list:
- add generalized linear models (glms)
- add moderated mediation / mediated moderation
- add learning curve
- allow a "generalized" version (like R's boot), to pass in own function.
 
 

  
##### Changelog
- Aug 2014: Added a rough draft of a bootstrap primer. Added functionality to doBoot to accept custom functions.
- Jan 2014: First basic version. means, correlations, differences, linear (fixed and mixed) regressions.
