library(ggplot2)

library(lubridate)


#######################
# your turn
ord <- read.csv("http://heike.github.io/R-workshops/02b-r-graphics/data/04-data/chicago.csv", stringsAsFactor=FALSE)
head(ord)
ord$Date <- ymd(ord$Date)

####
# date variable Date

# make a weekday variable
ord$weekday <- wday(ord$Date, label=TRUE)

# plot departure delays by weekday
qplot(weekday, data=ord, geom="bar", fill=DepDelay>15) 
# there are more flights on Sunday and Monday, fewest on Saturday - how many Sundays and Mondays did June 2008 have?

# 
table(wday(ymd("2008/06/01")+0:30, label=TRUE))

qplot(weekday, data=ord, geom="bar", fill=DepDelay>15, position="fill") 
# only half of the flights on Sundays and Fridays leave within 15 minutes of their scheduled times

# change TimeIndx to a date variable
library(lubridate)
nasa$Date <- origin
year(nasa$Date) <- nasa$Year
month(nasa$Date) <- nasa$Month

qplot(Date, ps_tovs, 
      data=subset(nasa, Gridx == 1 & Gridy == 1), 
      geom="line")

qplot(Date, ps_tovs, 
      data=nasa, 
      geom="line", group = interaction(Gridx, Gridy))
