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

avg.ratings = ddply(fflong, .(time, variable), summarise, mean.rating = mean(value, na.rm=TRUE))
qplot(x=time, y=mean.rating, group=variable, colour=variable, geom="line", data=avg.ratings)


diff.ratings = ddply(fflong, .(time, treatment, subject, variable), summarise, diff = abs(diff(value)))
qplot(x=diff, geom="density", colour=variable, data=diff.ratings)+ facet_wrap(~subject, scales="free")

avg.oil.ratings = ddply(fflong, .(time, treatment, variable), summarise, mean.rating = mean(value, na.rm=TRUE))
qplot(x=time, y=mean.rating, colour=treatment, group=treatment, geom="line", data=avg.oil.ratings)+ facet_grid(.~variable)

#############
library(stringr)

help(package="stringr")

str_trim("    hey you ")
str_split("Susan VanderPlas", " ")
names <- c("Susan VanderPlas", "Eric Hare", "Karsten Maurer")
str_split(names, " ")
word(names)
word(names, start=2)

sentance <- "I don't like cats"
str_replace(sentance, "cats", "dogs")
str_replace(sentance, "'", "")
str_replace(sentance, "don't ", "")

first <- str_sub(names, 1,1)
last <- str_sub(names, -1, -1)

###############
# back to baseball for a bit

baseball <- ddply(baseball, .(id), transform, season = year-min(year)+1)

qplot(jitter(season), h, data=baseball, geom="point", alpha=I(.05)) + geom_smooth() + xlim(c(0,25))
qplot(jitter(season), ab, data=baseball, geom="point", alpha=I(.05)) + geom_smooth()+ xlim(c(0,25))
qplot(season, geom="bar", data=subset(baseball, ab > 200), binwidth=1) + ggtitle("More than 200 times at bat")

#************* Your turn: ******************************************************
# Use Stringr and transform to create separate variables for the 
# state, city, and height in inches of each user.
#*******************************************************************************


profile <- read.csv("http://www.stat.iastate.edu/centers/CCGS/R\\%20workshops/03-r-format/data/OkCupid.csv", stringsAsFactors=FALSE)


#State/City

profile$city <- word(profile$location, sep=", ")
profile$state <- word(profile$location, sep=", ", start=-1) # can also use start=2, but this gives strange results if they list extra information...

#Height
profile$height.ft <- word(profile$Height, sep="ft ")
profile$height.in <- word(
  word(profile$Height, sep="in ")
  , start=-1)
# alternately
profile$height.in <- 
    str_sub(profile$Height[1:10], 
            start=str_locate(profile$Height[1:10], "ft ")[,2]+1, 
    				# start at the end of "ft "
            # bonus points if you realized that this is always the 4th character 
            end=str_locate(profile$Height[1:10], "in")[,1]-1 
    				# end at the start of "in"
            )

# this is easier with regular expressions (if you are familiar with them).

profile <- transform(profile, height.in.inches=as.numeric(height.ft)*12+as.numeric(height.in))
qplot(x=height.in.inches, geom="density", color=gender, data=profile, adjust=2)


compute_height <- function(x){
  height.ft <- word(x$Height, sep="ft ")
  height.inches <- word(
    word(x$Height, sep="in ")
    , start=-1)
  
  x$height_in_inches <-
    as.numeric(height.ft)*12+as.numeric(height.inches)
  return(x)
}

profile2 <- ddply(profile, .(Height), compute_height)

qplot(x=height_in_inches, geom="density", color=gender, data=profile2, adjust=2)

#************* Your turn: ******************************************************
# Use ddply to create a dataset that examines the proportion of users of  
# each gender and one other variable in each state that are on OkCupid.
#*******************************************************************************

state.freq <- ddply(profile, .(state), function(x){
    y <- table(x$gender, x$orientation)
    y <- as.data.frame(y) # convert to data frame
    names(y) <- c("gender", "orientation", "freq")
    y$prop <- y$freq/sum(y$freq)
    y$state <- x$state[1]
    y$total.state.users <- sum(y$freq)
    y
})

state.freq$state <- factor(state.freq$state, levels=with(subset(state.freq, gender=="F" & orientation=="Straight"), state[order(prop, decreasing=TRUE)]))
qplot(x=state, y=prop, group=gender, data=subset(state.freq, total.state.users>50), geom="line", colour=gender) + facet_wrap(~orientation) + coord_flip()

# so for each state, the proportion of lesbian/gay/bisexual individuals is approximately constant, but the proportion of straight females and males seem to be approximately inversely related.


#************* Your turn: ******************************************************
# For each state, return the longest essay (essay_0) for each gender
#*******************************************************************************

essays <- dlply(profile, .(state, gender), function(x){
	len <- str_length(x$essay_0)
	x$essay_0[which.max(len)]
})

#************* Your turn: ******************************************************
# From the previous output, extract the most common word (use
# table() and order()) and count the number of sentences (or at
# least the number of "."’s. ).
#*******************************************************************************

stats <- ldply(essays, function(x){
	clean <- tolower(x)
	clean <- gsub("[^ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]", " ", clean)
	clean <- gsub("my self summary", "", clean)
	words <- unlist(str_split(clean, pattern = " "))
	words <- words[which(str_length(words)>3)] # get rid of i, and, but, the, etc.
	freq.word <- if(length(words)>0) table(words) else NULL
	common.word <- if(length(freq.word)>0) names(freq.word)[order(freq.word, decreasing=TRUE)][1] else NA
	sentences <- str_split(tolower(x), pattern=fixed("."))
	sentences <- if(length(sentences)>0) length(sentences[[1]]) else NA
	data.frame(common.word=common.word, sentences=sentences)
})

