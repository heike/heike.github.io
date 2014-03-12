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
ord <- read.csv("http://heike.github.io/R-workshops/02b-r-graphics/data/04-data/chicago.csv", stringsAsFactor=FALSE)

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
nasa <- read.csv("http://heike.github.io/R-workshops/02b-r-graphics/data/04-data/nasadata.csv")

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

#################
# your turn

# plot pressure

#################
# your turn

# Areas north of the equator have higher amplitude