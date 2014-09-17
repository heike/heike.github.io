# libraries
library(lubridate)
library(plyr)
library(reshape2)
library(data.table)

## Example 1
corn <- read.csv("corn.csv")
names(corn)
levels(corn$Measurement)
dim(corn)

plyr.agg <- ddply(corn, .(State, StateFIPS, County, CountyCode, Measurement),
                  summarise, means = mean(Value))


## Data tables

library(data.table)
help(data.table)

## start with a data frame
df <- data.frame(x=rep(c("a","b","c"), each=3), 
                 y=c(1,3,6), z = 1:9)

## convert to a data table
dt <- data.table(df)
head(dt)

## Indexing with data tables
## Wrong way
dt[, 1]
dt[, "x"]

## Right way
dt[, x]
dt[1:2,]

dt[, 1, with = FALSE] # or dt[, "x", with = FALSE]


## keys
tables()

setkey(dt, x)
tables()
dt["b",] # dt["b] also works


## A larger example
grpsize <- ceiling(10e6 / 26^2)
DF <- data.frame(x = rep(LETTERS,each = 26 * grpsize), 
                 y = rep(letters, each = grpsize),
                 v = runif(grpsize * 26^2), 
                 stringsAsFactors = FALSE)
dim(DF)
DT <- data.table(DF)
setkey(DT, x, y)
tables()

# grand sum of v
DT[,sum(v)]

# sum over v by x
head( DT[,sum(v), by = x] )


# sum over v by x and y
DT[,sum(v), by = "x,y"]  ## no space!


## Loading the crime data
load("crime.rda")
str(crime)


## convert to a data table
crime <- as.data.table(crime)

## A quick table
crime[, .N, by = bail_status]
crime[!is.na(bail_status), .N, by = bail_status]


