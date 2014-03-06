### ----------------------------------###
          ### Your Turn ###
### ----------------------------------###

#states.health.stats <- ddply(brfss, .(state.name), summarise,
#                      no.coverage = sum(HLTHPLAN==2, na.rm=T)/length(HLTHPLAN)
#)
#write.csv(states.health.stats,"states.health.stats.csv",row.names=FALSE)

head(states.health.stats)

states.health.map <- merge(states, states.health.stats, by.x="region", by.y="state.name", all.x=T)

qplot(long, lat, geom="polygon", data=states.health.map, group=group, fill=no.coverage) +
  coord_map() +  theme_bw() +
  scale_fill_gradient2(low="lightgray",high="darkgreen") + 
  opts(axis.ticks = theme_blank(),axis.text.x = theme_blank(), axis.title.x=theme_blank(),
       axis.text.y = theme_blank(), axis.title.y=theme_blank()) +
  ggtitle("Map of Child Health Care Undercoverage by State")
