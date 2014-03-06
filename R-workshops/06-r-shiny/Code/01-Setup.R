### Introduction and Setup

# install shiny:
install.packages("shiny")
library(shiny)

# install other required packages for this workshop:
tmp <- installed.packages()
workshop.packages <- c("ggplot2", "plyr", "lubridate")
to.install <- workshop.packages[which(!workshop.packages%in%tmp[,1])]
if(length(to.install)>0){
  install.packages(to.install)
}  else {
  library(ggplot2)
  library(plyr)
  library(lubridate)
  qplot(x=0, y=0, label="Good to go!", geom="text") + theme_bw() + theme(axis.text=element_blank(), axis.title=element_blank(), axis.ticks=element_blank())
}

# Simple Shiny Applet
library(shiny)
runExample("01_hello")