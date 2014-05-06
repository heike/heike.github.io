# Solutions for yours turns in qplot section of graphics R workshop

# Preliminaries
library(ggplot2)
# load in the tips data
library(reshape)
head(tips)

################################
### YOUR TURN 1 Scatterplots ###
################################


qplot(tip,total_bill,geom="point", data=tips)
# add color by smokers
qplot(tip,total_bill,geom="point", data=tips, colour=smoker)
# add axis labels
qplot(tip,total_bill,geom="point", data=tips, colour=smoker,
      xlab="Tip (in dollars)", ylab="Total Bill (in dollars)",
      main="Scatterplot of Tip by Total Bill,
      Colored by Smoking Status")




################################
### YOUR TURN 2 histograms   ###
################################

tips$rate <- tips$tip/tips$total_bill
qplot(rate,geom="histogram", data=tips)
qplot(rate,geom="histogram", data=tips, binwidth=.05)
qplot(rate,geom="histogram", data=tips, binwidth=.05, facets=size~.,
      xlab="Tipping Rate", ylab="Count",
      main="Histogram for tipping rate, faceted by group size")

qplot(rate,geom="histogram", data=tips, binwidth=.05, facets=time~size~sex,
      xlab="Tipping Rate", ylab="Count",
      main="Histogram for tipping rate, faceted by group size")



################################
### YOUR TURN 3 Boxplots     ###
################################

qplot(sex, rate, geom="boxplot", data=tips)
qplot(sex, rate, geom="boxplot", data=tips, 
      xlab="Gender", ylab="Tipping Rate",
      main="Boxplots of tipping rate by gender") + geom_jitter()







################################
### YOUR TURN 4 barplots     ###
################################

qplot(smoker, geom="bar", data=tips)
qplot(smoker, geom="bar", data=tips, facets=time~day,
      xlab="Smoking Status",
      ylab="Count",
      main="Bar plots for smoking status faceted by time and day of week")








