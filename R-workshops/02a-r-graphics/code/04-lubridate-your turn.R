library(ggplot2)

library(lubridate)


#######################
# your turn
ord <- read.csv("http://www.hofroe.net/R workshops/01-r-intro/data/05-data/chicago.csv")
head(ord)

####
# date variable Date

# make a weekday variable
ord$weekday <- wday(ord$Date, label=TRUE)

# plot departure delays by weekday
qplot(weekday, data=ord, geom="bar", fill=DepDelay>15) 
# there are more flights on Sunday and Monday, fewest on Saturday - how many Sundays and Mondays did June 2008 have?

# 
table(wday(as.Date("2008/06/01")+0:30, label=TRUE))

qplot(weekday, data=ord, geom="bar", fill=DepDelay>15, position="fill") 
# only half of the flights on Sundays and Fridays leave within 15 minutes of their scheduled times