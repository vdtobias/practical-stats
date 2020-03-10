
## Some of the data sets for these exercises come from the website for 
## "The R Book" by Michael J. Crawley, John Wiley & Sons, Ltd, United Kingdom, 2013. 
## http://www.bio.ic.ac.uk/research/mjcraw/therbook/index.htm


##############################################################################
## The file ozone.data.txt contains data on solar radiation, air temperature, 
## wind speed, and ozone concentration.
## 
## How does ozone concentration relate to the three variables solar radiation, 
## air temperature, and wind speed?

ozone_df <- read.table(file.path("data","ozone.data.txt"), header=TRUE)

## Investigate the data, e.g., the format, the field names, the number of 
## observations, the data types, any missing values:





## Exploratory plots:
## Look at the relationships between all of the variables.







## Decide what variables to include in the fullest model, and define new variables 
## as needed (maybe standardized variables?). Should there be some nonlinear terms 
## in rad, temp, and/or wind? What about interactions?







## Fit the fullest model and start removing terms as appropriate.
## You can use the function update() to do this. For example, suppose you want to 
## remove the variable x from the object model_1. The syntax would look like this:
## 
## model_1 <- lm(...)
## model_2 <- update(model_1, ~. - x)








## Look at diagnostics for whatever model is "best" so far:








## How are the assumptions about constant variance and normality of errors looking?
## If they're violated, maybe try a variable transformation and then refit the model 
## (starting with the fullest model).







## Look at diagnostics for whatever model is "best" now:



