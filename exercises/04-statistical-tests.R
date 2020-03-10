
## Some of the data sets for these exercises come from the website for 
## "The R Book" by Michael J. Crawley, John Wiley & Sons, Ltd, United Kingdom, 2013. 
## http://www.bio.ic.ac.uk/research/mjcraw/therbook/index.htm


##############################################################################
## Z-test for a population mean.
## 
## Does the sample data in data_1.csv come from a population with mean 0?
## The population standard deviation for this data set is 1.35.

data_1 <- read.csv(file.path("data","data_1.csv"), header=TRUE)




##############################################################################
## t-test for a population mean.
##
## Does the sample data in data_2.csv come from a population with mean 10, or is the
## population mean less than 10?

data_2 <- read.csv(file.path("data","data_2.csv"), header=TRUE)




##############################################################################
## Test for a population variance.
##
## Does the sample data in data_3.csv come from a population with variance 25?

library(EnvStats)

data_3 <- read.csv(file.path("data","data_3.csv"), header=TRUE)




##############################################################################
## Tests for normality.
##
## Which of these sample data sets come from normally distributed populations?

## 1)
data_4 <- read.csv(file.path("data","data_4.csv"), header=TRUE)




## 2)
data_5 <- read.csv(file.path("data","data_5.csv"), header=TRUE)





##############################################################################
## Fisher's F-test to compare two population variances.
## 
## f.test.data.txt: measurements of ozone levels in two gardens.
## Do the two gardens have equal variability in ozone levels?

f.test.data <- read.table(file.path("data","f.test.data.txt"), header=TRUE)





##############################################################################
## Student's t-test to compare two population means (unpaired data).
## 
## t.test.data.txt: measurements of ozone levels in two gardens.
## Do the two gardens have equal concentrations of ozone?

t.test.data <- read.table(file.path("data","t.test.data.txt"), header=TRUE)





##############################################################################
## Paired t-test to compare means from two paired samples (paired data).
## 
## streams.txt: biodiversity scores on aquatic invertebrates from two locations 
## within the same stream, downstream and upstream of sewage outfall.
## 
## Do the two locations have equal biodiversity scores?

streams <- read.table(file.path("data","streams.txt"), header=TRUE)





##############################################################################
## Contingency table.
## 
## fish.csv: data from an experiment looking at mortality in fish that were 
## tagged or not tagged.
## 
## Is there a difference in survival between the tagged and untagged fish?

fish <- read.csv(file.path("data","fish_tag_data.csv"), header=TRUE)


