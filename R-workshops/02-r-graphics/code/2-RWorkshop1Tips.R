# Lets get straight to looking at a data set in R! The tips data if on restaurant tipping.
#   (this data should be preloaded from the setup at the beginning of the workshop)
tips


# Woa! That is a whole lot of lines in the console, lets look at just the top few rows.
head(tips)


# How big is tips? What types of variables are in the columns?
str(tips)


# It looks like I have 3 numerical variables and 4 character variable
# Lets get a summary of these columns of my data set
summary(tips)


# Look at the way that cost of the total bill might effect the tip value
#   using base R function plot()
plot(tips$tip, tips$total_bill)
#   using ggplot2 package
qplot(tip, total_bill, geom="point", data=tips) 

qplot(tip, total_bill, geom="point", data=tips, colour=time)

# Could try fitting a simple linear regression model to these data using lm() function
lm(tips$tip ~ tips$total_bill)
# See how a linear model fit to the this relationship would be plotted
qplot(tip, total_bill, geom="point", data=tips) + geom_smooth(method="lm")


# Create a new variable using two of the existing variable 
tips$rate <- tips$tip / tips$total_bill
# What are the properties of this new variable for tipping rate?
summary(tips$rate)


# Histogram of the tipping rate values 
#  plot using function qplot() from ggplot2 package
qplot(rate, data=tips, binwidth=.05)


# One value really really high lets look at that observation
tips[which.max(tips$rate),]


# Is the average tipping rate different between the gender of the individual paying the bill?
mean(tips$rate[tips$sex=="Male"])
mean(tips$rate[tips$sex=="Female"])


# Is that difference statistically significant; use t.test() function
t.test(rate ~ sex , data=tips)


# side by side boxplots of tip values grouped by smoking status
#   using ggplot2 package
qplot(smoker, rate, geom="boxplot",data=tips)



#----------------------------------------------------------------------------

# Your turn: before we get into the nuts and bolts of how this all works
# Try exploring the iris data set that is preinstalled in base R with techniques
# the motivating example above.

# Just to get you started with this data set
iris
head(iris)
plot(iris)
# Use what you see from this to try to find interesting things about the iris data!