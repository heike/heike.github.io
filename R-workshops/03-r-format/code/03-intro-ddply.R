library(plyr)
help(baseball)
head(baseball)
tail(baseball)

# subsetting on individual players:

ss <- subset(baseball, id=="sosasa01")
head(ss)

mean(ss$h/ss$ab)

# writing a first for loop

# index set:
players <- unique(baseball$id)

n <- length(players)
ba <- rep(NA, n)
games <- rep(NA, n)
atbats <- rep(NA, n)

for (i in 1:n) {
	career <- subset(baseball, id == players[i])
	ba[i] <- with(career, mean(h/ab, na.rm=T))
    games[i] <- with(career, sum(g, na.rm=T))
	atbats[i] <- with(career, sum(ab, na.rm=T))
	#ba[i] <- mean(career$h/career$ab, na.rm=T))
  # If not using with
#   ba[i] <- mean(career$h / career$ab, na.rm = T)
}

summary(ba)

##############
# your turn

##############
# combine all results

frame <- data.frame(players, games, atbats, ba)
qualified <- subset(frame, (games>=1000) & (atbats >= 1000))
head(qualified[order(qualified$ba), ])
head(qualified[order(qualified$ba, decreasing=TRUE), ])
top.players <- qualified[order(qualified$ba, decreasing=TRUE), ]$players[1:20]
##############
# first ddply

allstats <- ddply(baseball, .(id), mean)
# not very useful

##############
# summarize

summarize(baseball, bavg = mean(h/ab, na.rm=T))

summarize(baseball, 
  bavg = mean(h/ab, na.rm=T),
  games = sum(g, na.rm=T),
  hr=sum(hr, na.rm=T),
  ab = sum(ab, na.rm=T))
  
summarize(subset(baseball, id=="sosasa01"), 
  bavg = mean(h/ab, na.rm=T),
  games = sum(g, na.rm=T),
  hr=sum(hr, na.rm=T),
  ab = sum(ab, na.rm=T))  
  
  
##############
# alternative results for previous your turn

careers_ba <- ddply(baseball, .(id), summarise, ba = mean(h/ab, na.rm=T))

careers <- ddply(baseball, .(id), summarise,
	ba = mean(h/ab, na.rm=T),
	games = sum(g, na.rm=T),
	atbats = sum(ab, na.rm=T),
	first = min(year),
	last = max(year)
) 

teams <- ddply(baseball, .(team), summarise, num.players = length(unique(id)), first.season = min(year), last.season = max(year))


head(careers[order(careers$ba, decreasing=TRUE),], 20)
careers <- careers[order(careers$ba, decreasing=TRUE),]

