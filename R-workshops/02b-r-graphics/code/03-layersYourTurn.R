library(ggplot2)


## For this section we will be using a working directory ##
getwd() # shows path to your current working directory
setwd() # sets new working directory 
#here is an example of a path assignment  
setwd("C:/Users/Karsten/Desktop")   #  <---  you will need to change the path to be specific to your machine
# on the Mac: CMD-d


## NOAA data ##
# download file from 
# http://www.public.iastate.edu/~hofmann/looking-at-data/data/noaa.rdata
# Save this file into your working directory

# load the NOAA data
load("noaa.rdata")

# creates data frames gliders, floats, boats and rig in the working space
ls()

# load animals data set from USFW
animals <- read.csv("http://www.public.iastate.edu/~hofmann/looking-at-data/data/animal.csv")




###################
### Your Turn 1 ###
###################
qplot(Depth, Temperature, colour=callSign, data=floats)   
ggplot(aes(Depth, Temperature, colour=callSign), data=floats)  + geom_point()




###################
### Your Turn 2 ###
###################
# install.packages("maps")  # if you do not have the maps package
library(maps)
states <- map_data("state")
head(states)

animals <- read.csv("http://www.public.iastate.edu/~hofmann/looking-at-data/data/animal.csv")
head(animals)

qplot(Longitude, Latitude, data=animals)
qplot(Longitude, Latitude, data=animals, colour=class)
qplot(Longitude, Latitude, data=subset(animals, Alive=="N"), colour=class)

# save the layer for sighting locations for dead animals:
sightings <- geom_point(aes(Longitude, Latitude, colour=class), data=subset(animals, Alive=="N"))
# save map layer:
map <- geom_path(data=states, aes(x=long, y=lat, group=group))

# as ggplot statement:
ggplot() + sightings

# add map and crop:
ggplot() + map + sightings + 
  geom_point(aes(x, y), shape="x", size=5, data=rig) + 
  geom_text(aes(x, y), label="BP Oil rig", shape="x", size=5, data=rig, hjust = -0.1) + 
  xlim(c(-98, -80)) + 
  ylim(c(24,33))

levels(animals$class)
levels(animals$class) <- c("Birds", "Mammals", "Reptiles")

# indicate time - make use of Date variable
# install.packages("lubridate")
library(lubridate)

animals$Date <- as.Date(animals$Date)
sightings <- geom_point(aes(Longitude, Latitude, colour=as.numeric(Date), shape=class), data=subset(animals, Alive=="N")) 

ggplot() + map + sightings + 
  scale_colour_gradient() +
  geom_point(aes(x, y), shape="x", size=5, data=rig) + 
  geom_text(aes(x, y), label="BP Oil rig", shape="x", size=5, data=rig, hjust = -0.1) + 
  xlim(c(-98, -80)) + 
  ylim(c(24,33))

sightings <- geom_point(aes(Longitude, Latitude, colour=month(Date), shape=class), data=subset(animals, Alive=="N")) 

ggplot() + map + sightings + 
  geom_point(aes(x, y), shape="x", size=5, data=rig) + 
  geom_text(aes(x, y), label="BP Oil rig", shape="x", size=5, data=rig, hjust = -0.1) + 
  xlim(c(-98, -80)) + 
  ylim(c(24,33))

#################
