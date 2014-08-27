library(ggplot2)


## For this section we will be using a working directory ##
getwd() # shows path to your current working directory
setwd() # sets new working directory 
#here is an example of a path assignment  
setwd("C:/Users/Karsten/Desktop")   #  <---  you will need to change the path to be specific to your machine
setwd("/storage/Rprojects/RWorkshops/R-workshops/02-r-graphics/data")
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

###------------------------------------------###
        ### Start to plot it all ###
###------------------------------------------###

# locations of boats, floats, and gliders
# floats is the smallest object (should give you the least trouble)
qplot(Longitude, Latitude, colour=callSign, data=floats)
qplot(Longitude, Latitude, colour=callSign, data=boats)
qplot(Longitude, Latitude, colour=callSign, data=gliders)

# include spatial context:
# add symbol for rig on top of floats

# Caution! common problem:
qplot(Longitude, Latitude, colour=callSign, data=floats) + 
	geom_point(aes(x, y), shape="x", data=rig)
#Error in eval(expr, envir, enclos) : object 'callSign' not found

# 'break' connection between data sets by turning inheritance off
qplot(Longitude, Latitude, colour=callSign, data=floats) + 
	geom_point(aes(x, y), shape="x", data=rig, inherit.aes=FALSE)
	
qplot(Longitude, Latitude, colour=callSign, data=floats) + 
	geom_point(aes(x, y), shape="x", size=5, data=rig, inherit.aes=FALSE)
	
qplot(Longitude, Latitude, colour=callSign, data=floats) + 
 	geom_point(aes(x, y), shape="x", size=5, data=rig, inherit.aes=FALSE) + 
 	geom_text(aes(x, y), label="BP Oil rig", shape="x", size=5, data=rig, hjust = -0.1, inherit.aes=FALSE)

###################
# qplot vs ggplot #

qplot(Longitude, Latitude, colour=callSign, data=floats)

ggplot(data=floats, aes(x=Longitude, y=Latitude, colour=callSign)) +
	geom_point() + 
	scale_x_continuous() + 
	scale_y_continuous() + 
	scale_colour_discrete ()

			
# But we don't need to be quite so verbose.  Scales are
# added automatically and first two aes params are x and y:
ggplot(floats, aes(Longitude, Latitude, colour = callSign)) + 
    geom_point()
    
# Temperature by callSign
qplot(callSign, Temperature, data=floats, geom=c("jitter", "boxplot"))

ggplot(floats, aes(callSign, Temperature)) + 
    geom_jitter() + 
    geom_boxplot()

#########
# including maps

# install.packages("maps")  # if you do not have the maps package
library(maps)
states <- map_data("state")
head(states)

ggplot() + 	# plot without a default data set
 geom_path(data=states, aes(x=long, y=lat, group=group)) + 
 geom_point(data=floats, aes(x=Longitude, y=Latitude, colour=callSign)) +   
 geom_point(aes(x, y), shape="x", size=5, data=rig) + 
 geom_text(aes(x, y), label="BP Oil rig", shape="x", size=5, data=rig, hjust = -0.1) + 
 xlim(c(-91, -80)) + 
 ylim(c(22,32))

# save map layer:
map <- geom_path(data=states, aes(x=long, y=lat, group=group))


