library(ggplot2)

library(lubridate)
help(package=lubridate)

now()
today()


ymd("2012-06-05") 
mdy("06/05/2012") 
dmy("05062012")

ymd_hms("2011:06:05 14:50:30")
ymd_hm("2011:06:05 14:50")





#################
# your turn

ord <- read.csv("http://www.stat.iastate.edu/centers/CCGS/R%20workshops/02-r-graphics/data/04-data/chicago.csv", stringsAsFactor=FALSE)
head(ord)
ord$Date <- ymd(ord$Date)

#################
# working with dates

now() > ymd("1970-01-01")

now() - ymd("1970-01-01")

month(now())
wday(now())
wday(now(), label=TRUE)

month
methods(month)
month.default
getAnywhere(month.default)

#################
# your turn

# what weekday were you born?

mybirthday <- dmy("21-08-1987")
wday(mybirthday)
wday(mybirthday, label = TRUE)
now()-mybirthday


#################
ord$wday <- wday(ord$Date, label=TRUE)
qplot(wday, DepDelay, data=ord, geom="boxplot")
table(wday(ord$Date))

#################
nasa <- read.csv("http://www.hofroe.net/R%20workshops/02-r-graphics/data/05-data/nasadata.csv")

qplot(TimeIndx, ts, 
      data=subset(nasa, (Gridx==1) & (Gridy==1)))

qplot(TimeIndx, ts, 
      data=subset(nasa, (Gridx==1) & (Gridy==1)), 
      geom="line")

qplot(TimeIndx, ts, 
      data=subset(nasa, (Gridx==1)), 
      geom="line", group=Gridy)

qplot(TimeIndx, ts, 
      data=nasa, 
      geom="line", 
      group=interaction(Gridx, Gridy), 
      alpha=I(.1))


nasa$Date <- today()
year(nasa$Date) <- nasa$Year
month(nasa$Date) <- nasa$Month
qplot(Date, ts, data=nasa, 
      geom="line", 
      group=interaction(Gridx, Gridy), 
      alpha=I(.05)) + theme_bw()

#################
# your turn

# plot pressure

#################
# your turn

# change TimeIndx to a date variable
library(lubridate)
nasa$Date <- as.Date(origin)
year(nasa$Date) <- nasa$Year
month(nasa$Date) <- nasa$Month

qplot(Date, ts, 
      data=subset(nasa, (Gridx==1)), 
      geom="line", 
      group=Gridy)

# Which lines have the highest amplitude?
qplot(Date, ts, 
      data=subset(nasa, (Gridx==1)), 
      geom="line", 
      group=Gridy, colour=abs(Lat)) +
  scale_colour_gradient()

# Areas north of the equator have higher amplitude