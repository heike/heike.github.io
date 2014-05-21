# your turn
# find #games and #atbats for each player
players <- unique(baseball$id)
n <- length(players)
ba <- rep(NA, n)
games <- rep(NA, n)
atbats <- rep(NA, n)

for (i in 1:n) {
	career <- subset(baseball, id == players[i])
	ba[i] <- with(career, mean(h/ab, na.rm=T))
	games[i] <- sum(career$g, na.rm=T)
	atbats[i] <- sum(career$ab, na.rm=T)
}

# your turn
# summary statistics for teams with ddply

team.stats <- ddply(baseball, .(team), summarize,
  players = length(unique(id)),
  first = min(year, na.rm=TRUE),
  last = max(year, na.rm=TRUE)
)

library(ggplot2)
qplot(team, last-first, data=team.stats) # terrible chart

# flip and re-order:
qplot(reorder(team, last-first, max), last-first, 
      data=subset(team.stats, last-first > 0)) + 
        coord_flip() + theme_bw()
qplot(reorder(team, last-first, max), last-first, 
      data=subset(team.stats, last-first > 20)) + 
        coord_flip() + theme_bw()


team.year.stats <- ddply(baseball, .(team, year), 
                         summarize,
                         players = length(unique(id))
                         )

qplot(year, players, data=team.year.stats) + geom_smooth()

