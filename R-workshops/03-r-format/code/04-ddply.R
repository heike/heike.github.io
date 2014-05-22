library(plyr)
library(ggplot2)
library(reshape2)

###############
data(french_fries)

fflong <- melt(french_fries, id.vars=1:4)

#************* Your turn: ******************************************************
# Use ddply to examine some of the questions posed, i.e. 
# How do average ratings change over time for each variable?
# How similar are different replicates for each subject?
# Do different oils have different average rating trajectories over time?
#*******************************************************************************








#############
library(stringr)

help(package="stringr")

str_trim("    hey you ")
str_split("Susan VanderPlas", " ")
names <- c("Susan VanderPlas", "Eric Hare", "Karsten Maurer")
str_split(names, " ")
word(names)
word(names, start=2)

sentence <- "I don't like cats"
str_replace(sentence, "cats", "dogs")
str_replace(sentence, "'", "")
str_replace(sentence, "don't ", "")

first <- str_sub(names, 1,1)
last <- str_sub(names, -1, -1)

###############
# back to baseball for a bit

baseball <- ddply(baseball, .(id),
                  transform, 
                  season = year-min(year)+1)

qplot(jitter(season), h, data=baseball, geom="point", alpha=I(.05)) + geom_smooth(method="lm") + xlim(c(0,25))
qplot(jitter(season), ab, data=baseball, geom="point", alpha=I(.05)) + geom_smooth(method="lm")+ xlim(c(0,25))
qplot(season, geom="bar", data=subset(baseball, ab > 200), binwidth=1) + ggtitle("More than 200 times at bat")

#************* Your turn: ******************************************************
# Use Stringr and transform to create separate variables for the 
# state, city, and height in inches of each user.
#*******************************************************************************

profile <- read.csv("http://heike.github.io/R-workshops/03-r-format/data/OkCupid.csv", stringsAsFactors=FALSE)


# State/City



# get Height in feet and inches separately


# this is easier with regular expressions (if you are familiar with them).

# Transform


#************* Your turn: ******************************************************
# Use ddply to create a dataset that examines the proportion of users of  
# each gender and one other variable in each state that are on OkCupid.
#*******************************************************************************





#************* Your turn: ******************************************************
# For each state, return the longest essay (essay_0) for each gender
#*******************************************************************************





#************* Your turn: ******************************************************
# From the previous output, extract the most common word (use
# table() and order()) and count the number of sentences (or at
# least the number of "."’s. ).
#*******************************************************************************


