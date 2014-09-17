
#############
# Your Turn

reshapeGUI()
gp_data.melt <- melt(data = gp_data, id.vars=c('YM'), measure.vars=c('Date.1','Date.2','Date.3','Date.4','Date.5'))
gp_dates <- gp_data.melt


#############
# Your Turn

acast(ffm, variable ~ time)
acast(ffm, variable ~ time, mean)
acast(ffm, variable ~ time, mean, na.rm=T)

overtime <- dcast(ffm, time + variable ~ ., mean, na.rm=T)
names(overtime)[3] <- "avg"
qplot(time, avg, group=variable, colour=variable, data=overtime, geom="line")
