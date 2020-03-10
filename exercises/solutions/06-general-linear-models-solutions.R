
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
## observations, the data types:
head(ozone_df)
nrow(ozone_df)
str(ozone_df)

summary(ozone_df$rad)
summary(ozone_df$temp)
summary(ozone_df$wind)
summary(ozone_df$ozone)


## Exploratory plots:
## Look at the relationships between all of the variables.
pairs(ozone_df, panel=panel.smooth)


## Decide what variables to include in the fullest model, and define new variables 
## as needed:
ozone_df$r <- scale(ozone_df$rad)[ ,1]
ozone_df$t <- scale(ozone_df$temp)[ ,1]
ozone_df$w <- scale(ozone_df$wind)[ ,1]

ozone_df$r2 <- ozone_df$r^2
ozone_df$t2 <- ozone_df$t^2
ozone_df$w2 <- ozone_df$w^2

ozone_df$rt <- ozone_df$r * ozone_df$t
ozone_df$rw <- ozone_df$r * ozone_df$w
ozone_df$tw <- ozone_df$t * ozone_df$w

ozone_df$rtw <- ozone_df$r * ozone_df$t * ozone_df$w



## Fit the fullest model:
fit_0 <- lm(ozone ~ r + t + w + r2 + t2 + w2 + rt + rw + tw + rtw, data=ozone_df)
summary(fit_0)


fit_1 <- update(fit_0, ~ . - rtw)
summary(fit_1)


fit_2 <- update(fit_1, ~ . - r2)
summary(fit_2)


fit_3 <- update(fit_2, ~ . - rt)
summary(fit_3)


fit_4 <- update(fit_3, ~ . - tw)
summary(fit_4)


fit_5 <- update(fit_4, ~ . - rw)
summary(fit_5)



## Look at diagnostics for whatever model is "best" so far:
par(mfrow=c(2,2))
plot(fit_5)



## Residuals increase with fitted values and are nonnormal.
## Try rerunning the analysis with log(y).

ozone_df$log_ozone <- log(ozone_df$ozone)
fit_00 <- lm(log_ozone ~ r + t + w + r2 + t2 + w2 + rt + rw + tw + rtw, data=ozone_df)
summary(fit_00)


ozone_df$log_ozone <- log(ozone_df$ozone)
fit_01 <- update(fit_00, ~ . - rtw)
summary(fit_01)


ozone_df$log_ozone <- log(ozone_df$ozone)
fit_02 <- update(fit_01, ~ . - rt)
summary(fit_02)


ozone_df$log_ozone <- log(ozone_df$ozone)
fit_03 <- update(fit_02, ~ . - tw)
summary(fit_03)


ozone_df$log_ozone <- log(ozone_df$ozone)
fit_04 <- update(fit_03, ~ . - rw)
summary(fit_04)


ozone_df$log_ozone <- log(ozone_df$ozone)
fit_05 <- update(fit_04, ~ . - t2)
summary(fit_05)



## Look at diagnostics for whatever model is "best" now:
par(mfrow=c(2,2))
plot(fit_05)



