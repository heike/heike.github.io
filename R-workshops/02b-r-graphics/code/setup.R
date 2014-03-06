packages <- c("ggplot2", "productplots", "GGally", 
"lubridate",
"maps","ggmap",
"animation")

install.packages(packages)

library(ggplot2)
library(productplots)
library(GGally)
library(lubridate)
library(maps)
library(animation)

# Interesting way to do this all at once:
# sapply(packages, library, character.only = TRUE)


today()
qplot(rnorm(100), rnorm(100), colour=factor(rbinom(100, 1, 0.5)))
qplot(rnorm(100), rnorm(100), colour=rbinom(100, 5, 0.2))
