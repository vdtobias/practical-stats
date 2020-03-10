
# Summarizing Data

# Setup -----------------------------------------------------
# If there were any packages to load, you would put them here.

# Load Data -------------------------------------------------

## For this excercise, we will use data from the USFWS Delta Juvenile Fish Monitoring Program.
## The dataset we're working with is just the 5 most common species and the most recent years. 
## If you're interested, you can download the whole dataset and metadata here: 
## dx.doi.org/10.6073/pasta/87dda12bed2271ce3d91abdb7864c50c

dj <- read.csv("./data/DJ_5spp.csv", stringsAsFactors = FALSE)

names(dj)

# Inspect the Data ---------------------------------------------

## Example:
### What kind of variable is Location?
class(dj$Location)
# "character"

# What kind of variables are "CommonName" and "FL"?
class(dj$CommonName)

class(dj$FL)


## Example: Change "Location" into a factor.
dj$Location <- as.factor(dj$Location)

# Change "CommonName" into a factor. 
dj$CommonName <- as.factor(dj$CommonName)


## How many times have we sampled each location?
table(dj$Location)

## How many times have we caught the species "threadfin shad"?
table(dj$CommonName)




# Summarize the Data ------------------------------------------

## What is the mean forklength (FL) of all fish in this dataset?
mean(dj$FL)



## How variable are the forklenghts?
sd(dj$FL)
var(dj$FL)


## What is the mean Secchi depth?
mean(na.omit(dj$Secchi)) #use na.omit to skip any missing values when you do calculations

## What is the mean WaterTemperature?
mean(na.omit(dj$WaterTemperature))


## Challenge: Is Secchi depth more variable than WaterTemperature?
sd(na.omit(dj$Secchi))/mean(na.omit(dj$Secchi))

sd(na.omit(dj$WaterTemperature))/mean(na.omit(dj$WaterTemperature))





# Graph the Data ---------------------------------------------

## Make a histogram of DO.
hist(dj$DO)




## Make a boxplot of Turbidity.
boxplot(dj$Turbidity)




## Make a set of boxplots to compare Turbidity by Location.
boxplot(dj$Turbidity~dj$Location)




## Make a scatterplot of 
plot(dj$Volume, dj$Count)




## Make a new variable in dj called "cpue" that is equal to Count divided by Volume.
dj$cpue <- dj$Count/dj$Volume



## Make a scatterplot with your new variable.
plot(dj$Turbidity, dj$cpue)







## Ajdust Graphs for Publication --------------------------------------

## Open the document Data_Visualization_Challenge.pdf.
## Try to reproduce the plot in that document. Work together. Have fun!
## Once you're satisfied with the graph, feel free to improve it or make a different graph.


# Original code to make the plot in the pdf:
par(cex = 1.5)
plot(dj$Turbidity, dj$cpue,
     bty = "l",
     xlim = c(0, 150),
     ylim = c(0, 0.6),
     pch = 16, col = dj$CommonName,
     xlab = "Turbidity (NTU)",
     ylab = "CPUE")
legend("topright",
       pch = 16, col = 1:5, legend = levels(dj$CommonName))




