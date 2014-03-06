library(ggplot2)

flights <- read.csv("http://www.public.iastate.edu/~hofmann/looking-at-data/data/jan19.csv")

source("http://www.public.iastate.edu/~hofmann/looking-at-data/rcode/airport-extra.R")

plotMap(getFlights(flights, 600, 2), 600)

mins <- seq(0,58, by=2)
hour <- seq(600, 1200, by=100)
seqs <- rep(hour, each=length(mins))
seqs <- seqs + mins

# working directory
getwd()

setwd("movie-stills")
for (i in seqs) {
	plotMap(getFlights(flights, i, 2),i)
	fname <- paste("jan19-",i,".png",sep="")
	ggsave(file=fname, width=6, height=4)
}


##################
library(ggplot2)
library(maps)
states <- map_data("state")
xlim <- range(states$long)
ylim <- range(states$lat)

library(cranvas)

flights <- read.csv("http://www.public.iastate.edu/~hofmann/looking-at-data/data/jan19.csv")
source("airport-extra.R")

loc <- updateData(getFlights(flights, 600, 2), time=600)

#loc <- rbind(loc, 
qflights <- qdata(loc, size=1)
qscatter(longitude, latitude, data=qflights, xlim=xlim, ylim=ylim)

mins <- seq(0,58, by=2)
hour <- seq(800, 1200, by=100)
seqs <- rep(hour, each=length(mins))
seqs <- seqs + mins


for (i in head(seqs,100)) {
	loc <- updateData(getFlights(flights, i, 2),i)
#	fname <- paste("jan19-",i,".png",sep="")
#	ggsave(file=fname, width=6, height=4)
  for (j in 1:3) qflights[,j] <- loc[,j]

  Sys.sleep(.001)
}

