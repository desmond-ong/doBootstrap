# Bootstrap scripts written by Desmond Ong (dco@stanford)
# Last updated: Jan 20, 2014

# This is the Readme File.

source("doBootstrap.r")



# doBoot is the basic function that calculates descriptive statistics
#
# results <- doBoot <- function(x, y=NULL, mediator=NULL, whichTest = "mean", numberOfIterations = 5000, 
# confidenceInterval=.95, na.rm=TRUE)
#
# Output: Results
#
# Input:
#   x = first data vector. Feed in a VECTOR!
#   y = second data vector (not necessary if you're doing statistics on one data vector only, e.g. mean)
#   mediator = mediator data vector (if you want to do mediation)
#   whichTest = the test you want to do, as a string. 
#       Currently the tests supported are:
#           "mean" (single vector test)
#           "correlation" (correlation between two vectors, paired)
#           "difference, unpaired" (difference between two vectors, unpaired)
#           "difference, paired" (difference between two vectors, paired)
#           "cohen, unpaired" (basically unpaired difference / pooled standard dev) * not bias corrected nor accelerated
#           "cohen, paired" (basically paired difference / standard deviation) * not bias corrected nor accelerated
#           "mediation" (calculates a x-->y, x-->med-->y mediation, using Benoit's bm.bootmed code)
#               basically just feeds into Benoit's code for now.
#
#   numberOfIterations = number of bootstrapping iterations. Default is 5000
#   confidenceInterval = specifies the percentile of the CI. Default is .95
#   na.rm = remove NAs?
#

# using the mtcars dataset
head(mtcars)
resultsMean <- doBoot(mtcars$mpg)
resultsMean <- doBoot(mtcars$mpg, whichTest = "mean")
resultsCorrelation <- doBoot(mtcars$disp,mtcars$hp, whichTest = "correlation")
resultsDifference <- doBoot(mtcars$disp,mtcars$hp, whichTest = "difference, unpaired")
resultsDifference <- doBoot(mtcars$disp,mtcars$hp, whichTest = "difference, paired")
resultsCohen <- doBoot(mtcars$disp,mtcars$hp, whichTest = "cohen, unpaired")
resultsCohen <- doBoot(mtcars$disp,mtcars$hp, whichTest = "cohen, paired")

# just using Benoit's code off the bat...
resultsMediation <- doBoot(mtcars$disp,mtcars$hp, mtcars$cyl, whichTest = "mediation")



# # doBootRegression is the function you call if you want to bootstrap regressions.
#
# doBootRegression <- function(dataset, formula, mixedEffects = FALSE, numberOfIterations = 5000, 
# confidenceInterval=.95, na.rm=TRUE)
#
# Output: Results
#
# Input:
#   dataset = input dataset
#   formula = the regression formula of interest. For e.g., "y ~ x" or "y ~ x + (1|z)"
#   mixedEffects = whether your formula has mixed effects. Default FALSE.
#       If true, will use lmer, otherwise, lm. 
#       For lmer, will output only fixed effect coefficients
#       For lm, will output coefficients, and R^2
#   numberOfIterations = number of bootstrapping iterations. Default is 5000
#   confidenceInterval = specifies the percentile of the CI. Default is .95
#   na.rm = remove NAs?
#

resultsRegression <- doBootRegression(mtcars, disp~hp)
resultsRegression <- doBootRegression(mtcars, disp~hp+(1|cyl), mixedEffects = TRUE)




