install.packages("ggplot2", dependencies=TRUE)
# installs a few other packages as well
install.packages("plyr")
install.packages("MASS")
install.packages("gdata")
install.packages("foreign")
install.packages("reshapeGUI") # This may not work on a Mac...

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
