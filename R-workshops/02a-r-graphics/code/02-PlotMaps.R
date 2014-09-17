### ----------------------------------###
          ### Preliminaries ###
### ----------------------------------###

#load all libraries
library(ggplot2)
library(maps)
library(mapproj)

#load in data we will need later
states.stats <- read.csv("http://heike.github.io/R-workshops/02a-r-graphics/data/states.stats.csv")
states.sex.stats <- read.csv("http://heike.github.io/R-workshops/02a-r-graphics/data/states.sex.stats.csv")
states.health.stats <- read.csv("http://heike.github.io/R-workshops/02a-r-graphics/data/states.health.stats.csv")

# extract data on the state level from the maps package data
states <- map_data("state")



### ----------------------------------###
        ### Build a basic map ###
### ----------------------------------###


# lets look at the structure necessary for building a map
head(states)


#lets look at the data in its raw form - its a bunch of lat/long points
qplot(long, lat, geom="point", data=states)
# force the aspect ratio to be properly assigned in veiwing window
qplot(long, lat, geom="point", data=states) + coord_map()
# Lets connect the dots using "path" geom
qplot(long, lat, geom="path", data=states) + coord_map()
# oops that didn't work we need to tell it to group certain shapes
qplot(long, lat, geom="path", data=states, group=group) + coord_map()

# We can also make solid polygons instead of state outlines,
#   with these we can later assign colors to the polygons based on state information
qplot(long, lat, geom="polygon", data=states) + coord_map()
# Again, we need to specify the groupings
qplot(long, lat, geom="polygon", data=states, group=group, colour=I("white")) + coord_map()
qplot(long, lat, geom="polygon", data=states, group=group, fill=region, colour=I("black")) + coord_map()


### -------------------------------------------------------------###
### Incorporating information from another data set onto the map ###
### -------------------------------------------------------------###


# create state classifications data 
western <- c("california","nevada","oregon","washington","idaho","montana","wyoming",
                "colorado","utah","hawaii","alaska")
mw <- c("north dakota","south dakota","nebraska","kansas","missouri","iowa",
        "minnesota","wisconsin","michigan","illinois","indiana","ohio")
sw <- c("arizona","new mexico","texas","oklahoma")
south <- c("virginia","west virginia","kentucky","tennessee","north carolina","south carolina",
           "florida","georgia","alabama","mississippi","louisiana","arkansas")
ne <- c("maine","new hampshire","vermont","massachusetts","new york","rhode island",
        "connecticut","new jersey","pennsylvania","delaware","maryland")
State <- c(western,mw,sw,south,ne)
StateGroups <- c( rep("West", length(western)),
              rep("Midwest", length(mw)),
              rep("Southwest", length(sw)),
              rep("South", length(south)),
              rep("Northeast", length(ne)) )
statereg <- data.frame(State, StateGroups)


# In order to display state info from states.stats data on the polygons from the states data we need to merge
states.class.map <- merge(states, statereg, by.x="region", by.y="State", all.x=T)
states.class.map <- states.class.map[order(states.class.map$order),] 
states.map <- merge(states, states.stats, by.x="region", by.y="state.name", all.x=T)
states.sex.map <- merge(states, states.sex.stats, by.x="region", by.y="state.name", all.x=T)



# Display Country Regions using different color hues
#   (fill option does this automatically with character or factor variables)
qplot(long, lat, geom="polygon", data=states.class.map, group=group, fill=StateGroups, colour=I("black")) + coord_map()



# avg.qlrest2 is average number of last 30 days where did not get enouph sleep
# lets place this information as the color fill for each state polygon
qplot(long, lat, geom="polygon", data=states.map, group=group, fill=avg.qlrest2) + coord_map()


# avg.drnk is average number of drinks per day in last 30 days
# lets place this information as the color fill for each state polygon
qplot(long, lat, geom="polygon", data=states.map, group=group, fill=avg.drnk) + coord_map()
# now lets see how males and females differ in alcohol consumption in different states
qplot(long, lat, geom="polygon", data=states.sex.map, group=group, fill=avg.drnk, facets= .~sex) + coord_map()
# wrap the facets a nicer way
qplot(long, lat, geom="polygon", data=states.sex.map, group=group, fill=avg.drnk) + 
    coord_map() + facet_grid(sex ~ .)


### ----------------------------------###
        ### Cleaning up Plots ### 
### ----------------------------------###

# change theme to a white background with theme_bw()
# use theme() to remove axis labels
# Add a title with ggtitle()

qplot(long, lat, geom="polygon", data=states.map, group=group, fill=avg.drnk) + 
  coord_map() +  theme_bw() +
  scale_fill_gradient2(limits=c(1.5, 3),low="lightgray",high="red") + 
  theme(axis.ticks = element_blank(),axis.text.x = element_blank(), axis.title.x=element_blank(),
       axis.text.y = element_blank(), axis.title.y=element_blank()) +
  ggtitle("Map of Average Number of Alcoholic Beverages Consumed Per Day by State")


qplot(long, lat, geom="polygon", data=states.sex.map, group=group, fill=avg.drnk) + 
  coord_map() + facet_grid(sex ~ .) +   theme_bw() +
  scale_fill_gradient2(limits=c(1.5, 4),low="lightgray",high="red") + 
  theme(axis.ticks = element_blank(),axis.text.x = element_blank(), axis.title.x=element_blank(),
       axis.text.y = element_blank(), axis.title.y=element_blank()) +
  ggtitle("Map of Average Number of Alcoholic Beverages Consumed Per Day by State and Gender")


