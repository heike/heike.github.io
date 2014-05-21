#############
# Your Turn

gp_names <- read.table(file.choose(), 
                       header=FALSE, nrows=2, sep=",")

gp_data <- read.table(file.choose(), 
                      header=FALSE, skip=2, sep=",")


#############
# Your Turn
# read a csv file published as a webfile
gp <- read.csv("http://heike.github.io/R-workshops/03-r-format/data/01-data/midwest.csv")
# read (and find) a local csv file
gp <- read.csv(file.choose())


#############
# Your Turn
# read a SAS xport file published as a webfile

library(foreign)
# download file from http://www.cdc.gov/nchs/nhanes/nhanes2009-2010/exam09_10.htm
# then read:
bp <- read.xport(file.choose())
dim(bp)
summary(bp)
