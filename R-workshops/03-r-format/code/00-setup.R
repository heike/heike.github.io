install.packages("ggplot2", dependencies=TRUE)
# installs a few other packages as well
install.packages("MASS")
install.packages("gdata")
install.packages("foreign")
install.packages("reshapeGUI")
install.packages("data.table")

# If you have problems with gdata, try XLConnect
install.packages("XLConnect")

# Or if you are working on the terminal servers...
library("ggplot2")
library("plyr")
library("reshape2")
library("MASS")
library("gdata")
library("foreign")
library("reshapeGUI")
library("data.table")

###################
# only for large data
# install.packages("RMySQL")
# downloads and installs package DBI as well
# for Windows follow instructions at http://blog.tersmitten.nl/archives/1345