# Set up Rstudio  to run knitr

install.packages("knitr", dependencies=TRUE)
install.packages(c("Hmisc", "xtable"))

library(knitr)
library(Hmisc)
library(xtable)