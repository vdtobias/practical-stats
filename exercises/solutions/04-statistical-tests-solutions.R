
## Some of the data sets for these exercises come from the website for 
## "The R Book" by Michael J. Crawley, John Wiley & Sons, Ltd, United Kingdom, 2013. 
## http://www.bio.ic.ac.uk/research/mjcraw/therbook/index.htm


##############################################################################
## Z-test for a population mean.
## 
## Does the sample data in data_1.csv come from a population with mean 0?
## The population standard deviation for this data set is 1.35.

## H_0: mu = 0.
## H_a: mu != 0.

data_1 <- read.csv(file.path("data","data_1.csv"), header=TRUE)

nrow(data_1)
hist(data_1$Y)
mean(data_1$Y)
var(data_1$Y)

z_crit <- (mean(data_1$Y) - 0)/1.35
z_crit
pnorm(q = -z_crit, mean=0, sd=1, lower.tail=TRUE)




##############################################################################
## t-test for a population mean.
##
## Does the sample data in data_2.csv come from a population with mean 10, or is the
## population mean less than 10?

## H_0: mu = 10.
## H_a: mu < 10.

data_2 <- read.csv(file.path("data","data_2.csv"), header=TRUE)

nrow(data_2)
hist(data_2$Y)
mean(data_2$Y)
sd(data_2$Y)
qqnorm(data_2$Y)
qqline(data_2$Y)

t.test(x=data_2$Y, alternative="less", mu=10)




##############################################################################
## Test for a population variance.
##
## Does the sample data in data_3.csv come from a population with variance 25?

## H_0: sigma^2 = 25.
## H_a: sigma^2 != 25.

library(EnvStats)

data_3 <- read.csv(file.path("data","data_3.csv"), header=TRUE)

nrow(data_3)
hist(data_3$Y)
mean(data_3$Y)
sd(data_3$Y)
qqnorm(data_3$Y)
qqline(data_3$Y)

EnvStats::varTest(x=data_3$Y, alternative="two.sided", sigma.squared=25)




##############################################################################
## Tests for normality.
##
## Which of these sample data sets come from normally distributed populations?

## 1)
data_4 <- read.csv(file.path("data","data_4.csv"), header=TRUE)

nrow(data_4)
hist(data_4$Y)
mean(data_4$Y)
sd(data_4$Y)

qqnorm(data_4$Y)
qqline(data_4$Y)

shapiro.test(data_4$Y)



## 2)
data_5 <- read.csv(file.path("data","data_5.csv"), header=TRUE)

nrow(data_5)
hist(data_5$Y)
mean(data_5$Y)
sd(data_5$Y)

qqnorm(data_5$Y)
qqline(data_5$Y)

shapiro.test(data_5$Y)




##############################################################################
## Fisher’s F-test to compare two population variances.
## 
## f.test.data.txt: measurements of ozone levels in two gardens.
## Do the two gardens have equal variability in ozone levels?

## H_0: sigma^2_gardenB = sigma_^2_gardenC.
## H_a: sigma^2_gardenB != sigma_^2_gardenC.

f.test.data <- read.table(file.path("data","f.test.data.txt"), header=TRUE)

par(mfrow=c(1,2))
qqnorm(f.test.data$gardenB)
qqline(f.test.data$gardenB)

qqnorm(f.test.data$gardenC)
qqline(f.test.data$gardenC)

var.test(f.test.data$gardenB, f.test.data$gardenC)




##############################################################################
## Student’s t-test to compare two population means (unpaired data).
## 
## t.test.data.txt: measurements of ozone levels in two gardens.
## Do the two gardens have equal concentrations of ozone?

## H_0: mu_gardenA - mu_gardenB = 0.
## H_a: mu_gardenA - mu_gardenB != 0.

t.test.data <- read.table(file.path("data","t.test.data.txt"), header=TRUE)

par(mfrow=c(1,2))
qqnorm(t.test.data$gardenA)
qqline(t.test.data$gardenA)

qqnorm(t.test.data$gardenB)
qqline(t.test.data$gardenB)

par(mfrow=c(1,1))
boxplot(t.test.data)

var(t.test.data$gardenA)
var(t.test.data$gardenB)
var.test(t.test.data$gardenA, t.test.data$gardenB)

t.test(t.test.data$gardenA, t.test.data$gardenB)


## Test the same hypothesis with the Wilcoxon rank-sum test:
wilcox.test(t.test.data$gardenA, t.test.data$gardenB)




##############################################################################
## Paired t-test to compare means from two paired samples (paired data).
## 
## streams.txt: biodiversity scores on aquatic invertebrates from two locations 
## within the same stream, downstream and upstream of sewage outfall.
## 
## Do the two locations have equal biodiversity scores?

## H_0: mu_down - mu_up = 0.
## H_a: mu_down - mu_up != 0.

streams <- read.table(file.path("data","streams.txt"), header=TRUE)

par(mfrow=c(1,2))
qqnorm(c(streams$down, streams$up))
qqline(c(streams$down, streams$up))

par(mfrow=c(1,1))
boxplot(streams)

t.test(streams$down, streams$up, paired=TRUE)

## Compare to an unpaired test:
t.test(streams$down, streams$up, paired=FALSE)




##############################################################################
## Contingency table.
## 
## fish.csv: data from an experiment looking at mortality in fish that were 
## tagged or not tagged.
## 
## Is there a difference in survival between the tagged and untagged fish?

## H_0: there is no difference in survival between the tagged and untagged fish.
## H_a: there is a difference in survival between the two groups.

fish <- read.csv(file.path("data","fish_tag_data.csv"), header=TRUE)

table(fish$Treatment, fish$Status)

chisq.test(fish$Treatment, fish$Status)

## Fail to reject H_0.





