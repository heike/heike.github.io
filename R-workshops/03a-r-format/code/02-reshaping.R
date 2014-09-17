library(reshapeGUI)
library(ggplot2)

gp_data <- read.csv("http://heike.github.io/R-workshops/03-r-format/data/01-data/midwest.csv", header=FALSE, skip=2)
names(gp_data)
names(gp_data)[1] <- "YM"
names(gp_data)[-1] <- paste(rep(c("Date", "Value"), 5), rep(1:5, each=2), sep=".")

reshapeGUI()



# Make a copy of the molten data:
gp_prices <- melt(data = gp_data, id.vars=c('YM'), measure.vars=c('Value.1','Value.2','Value.3','Value.4','Value.5'))

# Your Turn
# Get dates in the same fashion
#############
gp_dates <- melt(data = gp_data, id.vars=c('YM'), measure.vars=c('Date.1','Date.2','Date.3','Date.4','Date.5'))


#############

# Create a long form dataset with dates, 
#   then add prices into the dataset
gasprices <- gp_dates
gasprices$prices <- gp_prices$value
head(gasprices)

# Could also use merge: we would need to select the 
# 1st and 3rd columns of gp_prices
# gasprices <- merge(gp_dates, gp_prices[,c(1,3)], by.x="YM", by.y="YM")

#####
tmp <- with(gasprices, paste(YM, value, sep="/"))
gasprices$date <- as.Date(tmp, format="%Y-%b/%d-%b")

#####

qplot(date, prices, data=gasprices, geom="line")


#############
library("reshape2")
help(french_fries)
head(french_fries)

ffm <- melt(french_fries, id.vars=1:4)
head(ffm)
summary(ffm)


#####
# casting:


acast(ffm, subject ~ .)
acast(ffm, subject ~ time)
acast(ffm, . ~ time)

out <- dcast(ffm, subject + variable~ ., mean)
names(out)[3] <- "mean"
qplot(variable, mean, geom = "boxplot", data = out)

out <- dcast(ffm, subject + variable + time ~ ., mean)
names(out)[4] <- "mean"
qplot(time, mean, data = out, geom = "line", group = variable, colour = variable, facets = ~subject)

dcast(ffm, subject ~ .)


reps <- dcast(ffm, time + subject + treatment + variable ~ rep)
qplot(`1`,`2`, data=reps)
qplot(`1`,`2`, data=reps, facets=~subject)
qplot(`1`,`2`, data=reps, facets=~subject, colour=variable)

###


overtime <- dcast(ffm, variable+time+treatment~., mean, na.rm=T)
names(overtime)[4] <- "avg.rating"
qplot(time, avg.rating, colour=variable, geom="line", group=variable:treatment, data=overtime)

acast(ffm, time ~ rep)

# what is the pattern of missing values?

acast(ffm, subject ~ .)
acast(ffm, subject ~ time)
# there's more missing values ...
acast(ffm, subject ~ time, mean)
acast(ffm, subject ~ time, function(x) length(x)-sum(is.na(x)))


#############
# Your Turn


#############