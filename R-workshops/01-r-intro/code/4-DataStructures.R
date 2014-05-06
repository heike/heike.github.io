
#------------------------------------------------------------------------------#
###  Data Frame Demo  ###

# Find a data frame to explore from list of data sets built into R
data()

# Use Edgar Anderson's Iris Data
flower <- iris
# Select Species column using "[,5]"
flower[,5]
# Select Species column using "$"
flower$Species
# Subset the data by indexing over only the rows
#   that have "setosa" for the Species variable
#
# We will use the following logical vector to 
#   index which rows we want to keep
flower$Species=="setosa"
# Insert the logical vector into [,] in the row index
flower[flower$Species=="setosa" , ]

# Create our own data frame using data.frame() function
mydf <- data.frame( NUMS = 1:5 , lets = letters[1:5] ,
                    vehicle = c("car","boat","car","car","boat") )
mydf
# Rename column 1 to lower case
names(mydf)[1] <- "nums"
mydf
str(mydf) 


# t-test using iris data to see if petal lengths for setosa and versicolor are the same
#   t.test function can only handle two groups, subset out the virginica species
t.test(Petal.Length ~ Species, data=iris[iris$Species!="virginica",])
# save the output of the t-test to an object
tout <- t.test(Petal.Length ~ Species, data=iris[iris$Species!="virginica",])
# can use the str() function to examine the output type
str(tout)
# pull off the pvalue
tout$p.value
tout[[3]]


##----------------------------------------------------------
# Reading in a CSV file 
setwd("C:/Users\\Karsten\\Desktop")
littledata <- read.csv("PretendData.csv",header=T)
littledata




