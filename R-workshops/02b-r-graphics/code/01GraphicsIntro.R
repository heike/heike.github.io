
### Setting up to use diamonds data set ### 

# Load ggplot2 package
library(ggplot2)
# Load diamonds data, comes with the ggplot2 package
data(diamonds)

# what does this data even look like?
# Lets look at the top few rows of the diamonds data frame
head(diamonds)
# look at the help file for variable descriptions
?diamonds


#-----------------------------------------------------------#

### Scatterplots with qplot() using geom="point" ###

# look at the relationship between carat and price of a diamond
qplot(carat, price, geom="point", data=diamonds)

# make points semi transparent
qplot(carat, price, geom="point", data=diamonds,  alpha=I(.2))
# note that if we dont use the I() function it creates an unwanted legend
qplot(carat, price, geom="point", data=diamonds,  alpha=.2)

# add a title and axis labels
qplot(carat, price, geom="point", data=diamonds,  alpha=I(.2),
      xlab="Carat (weight)", ylab="Price (US dollars)",
      main="Scatterplot of Diamond Carat and Price")

# can easily change the scale of one axis directly in the qplot statement
#   Lets plot the log transformed price vs carat weight
qplot(carat, log(price), geom="point", data=diamonds,  alpha=I(.2))

# we can also color the points by a grouping variable (diamond color rating) from the data set
#  Note: "colour=" is the option statement and "color" is a variable name
qplot(carat, log(price), geom="point", data=diamonds,
      alpha=I(.2), colour=color, main="Log price of diamonds by carat weight, grouped by color")


qplot(carat, log(price), geom="point", data=diamonds,
       colour=color, main="Log price of diamonds by carat weight, grouped by color")

qplot(carat, log(price), geom="point", data=diamonds,
      colour=clarity, main="Log price of diamonds by carat weight, grouped by color")


#-----------------------------------------------------------#

### Histograms with qplot() using geom="histogram" ###

# Look at the distribution of carat weights
qplot(carat, geom="histogram", data=diamonds)

# Set the binwidth and change the range
qplot(carat, geom="histogram", data=diamonds, binwidth=.1, xlim=c(0,3))

# facet by variable cut
qplot(carat, geom="histogram", data=diamonds, binwidth=.2,
      facets= . ~ cut )

# color the bars by variable of diamond color rating
qplot(carat, geom="histogram", data=diamonds, binwidth=.2, fill=color)


#-----------------------------------------------------------#

### Boxplots with qplot() using geom="boxplot" ###

#side by side boxplot of diamond prices within cut groupings
qplot(cut, price, geom="boxplot", data=diamonds)

#Add a layer: overlay points onto the boxplot
qplot(cut, price, geom="boxplot", data=diamonds) + geom_point()
#Doesnt look like much with them all overlapping on the line
# So, lets jitter the points and make them transparent
qplot(cut, price, geom="boxplot", data=diamonds) + geom_jitter(alpha=I(.05))
plot1 <- qplot(cut, price, geom="boxplot", data=diamonds)
plot1 +  geom_jitter(alpha=I(.05))
# Can transform the scales here as well and add a title
qplot(cut, log(price), geom="boxplot", data=diamonds,
      main="Boxplots of log Diamond Prices Grouped by Cut Quality") +
      geom_jitter(alpha=I(.05))

#-----------------------------------------------------------#

### Barplots with qplot() using geom="bar" ###
data()
# Lets shift over to a data set about passanger survival from sinking of the Titanic
titanic <- as.data.frame(Titanic)
head(titanic)

# Make barplot with bars for survival outcomes and bar heights as
#   a frequency of those outcomes
qplot(Survived, geom="bar", data=titanic, weight=Freq)

# See which passanger classes comprised those bars by filling with color
qplot(Survived, geom = "bar" , data = titanic , weight = Freq , fill = Class)

# Use faceting to make a barchart for these different classes
qplot(Survived, geom = "bar" , data = titanic , weight = Freq , facets= . ~ Class)

# Facet it further to see how men and women within each class fared
qplot(Survived, geom="bar", data=titanic, weight=Freq, facets=Sex~Class)







