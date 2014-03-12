packages <- c("ggplot2", 
              "gridExtra", "lubridate",
              "maps","ggmap", "mapproj")

install.packages(packages)

library(ggplot2)
library(lubridate)
library(maps)
library(ggmap)


# Interesting way to do this all at once:
# sapply(packages, library, character.only = TRUE)


today()
qplot(rnorm(100), rnorm(100), colour=factor(rbinom(100, 1, 0.5)))
qplot(rnorm(100), rnorm(100), colour=rbinom(100, 5, 0.2))
