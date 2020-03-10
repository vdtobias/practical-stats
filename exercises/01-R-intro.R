
# R Studio Introduction ----------------------------------------------------
# Panels
# 1. Console - where the code is executed
# 2. Environment - a list of objects that you've created (data, values, functions)
# 3. Plot - (usually) where graphs will be displayed
# 4. Code or Script - basically a text file that you can save to reuse.


# Code Set up  ------------------------------------------------------------------

## Install packates
# Just like any program, you have to download each package and install it on your computer.
# You only have to download a package once.
install.packages("dplyr")

## Load packages:
# Loading packages is like opening a program on your computer.
# It gets the package ready for you to use and puts it in your workspace.
# Load each package that you want to use at the beginning of your code like this:
library(dplyr)


# R basics ----------------------------------------------------------------

## Comments: anything after a single # is a comment. Use extra #'s for aesthetics. 

## Each command that you write should start on a new line. 
## Commands can take up multiple lines, but don't try to put two commands on one line.

## Running lines of code in RStudio:
## Use Ctrl+Enter or click 'Run' button on top right of this panel to run a line of code.
## Or highlight multiple lines and use Ctrl+Enter to run multiple lines of script
## To run entire script, use Ctrl+Shift+Enter or click 'Source' button on top right 
##		of this panel (maybe don't do this just yet).

## Help page for a given function:
?class

## Basic calculations:
3 + 4
5 - 5 
(5 + 5) / 2 

## Assignment operators: 
## Objects in R are defined with the symbols "<-" or "=".  
## Elements to the left of <- or = are the objects and the definition is to the right.
##   Or think of it as "name <- thing"
## Follow the convention and use <-.
## Differences between <- and = relate to scoping (?assignOps),	precedence (?Syntax), etc.

x <- 42
x

## Four data types:
## logical (Boolean), integer, double (also called numeric), character

my_logical_1 <- TRUE		# logical
my_logical_1 <- FALSE

my_numeric <- 4.5				# numeric

my_char_1 <- "Year"			# character
my_char_2 <- 'Year'



## Explain: functions & arguments

## Factor: categorical data (can only take predefined values):
factor_vector <- factor(c("Fish","Shrimp","Fish","Fish","Shrimp","JellyFish","JellyFish"))
factor_vector
class(factor_vector)



## Five basic data structures: vector, matrix, array, list, data frame

## Vector: one dimensional, only one data type:
numeric_vector <- c(1, 10, 49)					# "c" is for "combine"
character_vector <- c("a", "b", "c")
length(character_vector)			# number of elements

names(numeric_vector) <- character_vector
numeric_vector
names(numeric_vector)

my_vec_with_names <- c("a"=1, "b"=10, "c"=49)
my_vec_with_names

x <- c(1, NA, 3)
x


## List: like a vector except data types can be different:
my_list <- list(1:3, "a", my_mat, c(6.7,8.9))
my_list

names(my_list)		# a list can have names like a vector; this one doesn't have any
length(my_list)


## Data frame: two dimensional, each column can be a different data type, similar to a 
## database or Excel sheet:

name <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")
type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Create a data frame from the vectors: 
planets_df <- data.frame(name, type, diameter, rotation, rings)
# Remember: rows = observations, in this case a planet; 
#						columns = variables, in this case description of the planet.

# Look at our new data frame:
planets_df

# See the structure of a data frame (or any object):
str(planets_df)

# Accessing variables in a data frame:
planets_df$type
planets_df$diameter
planets_df$rings

# Data frame typically converts texts into factors automatically:
planets_df$name


# Clean up the variables we don't need:
# rm means "remove"
rm(name, type, diameter, rotation, rings)

# What happens if you try to acces the variable "diameter" without the data frame name?
diameter


## Logical operators:
# ==  equal to
# !   not
# !=  not equal to
# |   or (vectorized)
# &   and (vectorized)
# ||  or (only examines the first element of a vector)
# &&  and (only examines the first element of a vector)
# <=  less than or equal to
# etc.

x <- c(1,2,3)
y <- c(0,2,3)

x == y
x != y
x | y			# 1 is TRUE, 0 is FALSE
x || y
x & y
x && y
x %in% 3:5


## Basic subsetting and extracting:
## vectors:
x <- c("aa"=4,"bb"=2,"cc"=59,"dd"=371,"ee"=38.9)
x[2]
x["bb"]

x[-1]

## lists:
y <- list("aa"=1:5, "bb"="my_string", "cc"=list("f","g","h"))
y[2]		# the requested element in a list
y["bb"]

y[[2]]	# the request element itself
y[["bb"]]

y[1:2]	# multiple elements in a list

## data frames:
row.names(planets_df) <- planets_df$name
planets_df

planets_df[1, ]					# first row
planets_df["Mercury", ]

planets_df[ ,1]					# first column
planets_df[ ,"name"]
planets_df$name

planets_df[c(2,4),c("name","diameter","rings")]			# multiple rows and columns

planets_df[-c(1,2), ]		# everything but the first and second rows

planets_df[planets_df$type == "Gas giant", ]
subset(planets_df, type == "Gas giant")


## Look at current working directory:
getwd()
