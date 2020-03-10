
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




## Example: Change "Location" into a factor.
dj$Location <- as.factor(dj$Location)

# Change "CommonName" into a factor. 



## How many times have we sampled each location? (Hint: use the table function.)



## How many times have we caught the species "threadfin shad"?





# Summarize the Data ------------------------------------------

## What is the mean forklength (FL) of all fish in this dataset?




## How variable are the forklenghts?



## Example: What is the mean Secchi depth?
mean(na.omit(dj$Secchi)) #use na.omit to skip any missing values when you do calculations

## What is the mean WaterTemperature?



## Challenge: Is Secchi depth more variable than WaterTemperature?






# Graph the Data ---------------------------------------------

## Make a histogram of DO.





## Make a boxplot of Turbidity.





## Make a set of boxplots to compare Turbidity by Location.





## Make a scatterplot of Count and Volume





## Make a new variable in dj called "cpue" that is equal to Count divided by Volume.




## Make a scatterplot with your new variable.








## Ajdust Graphs for Publication --------------------------------------

## Open the document Data_Visualization_Challenge.pdf.
## Try to reproduce the plot in that document. Work together. Have fun!
## Once you're satisfied with the graph, feel free to improve it or make a different graph.






