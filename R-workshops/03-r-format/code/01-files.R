#########
# Reading files

# read a csv file published as a webfile
gp <- read.csv("http://heike.github.io/R-workshops/03-r-format/data/01-data/midwest.csv")

# read (and find) a local csv file
gp <- read.csv(file.choose())

# reveals awful format
head(gp)

str(gp)
# need to work at it a bit more
#########
# Your turn

#########

str(gp_data)

require(ggplot2)
qplot(V1, V3, data=gp_data) # looks strange - we'll need to fix this

#########
# load a library
library("gdata")
# get html page with an overview of the package functionality
help(package="gdata")


read.xls(xls, sheet = 1, verbose = FALSE, pattern, ..., method = c("csv", 
     "tsv", "tab"), perl = "perl")

gp2 <- read.xls(file.choose(), sheet=1)
head(gp2)
