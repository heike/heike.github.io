library(shiny)
library(ggplot2)
library(plyr)
# setwd("Your working directory here")

# Define server logic required to create application output
shinyServer(function(input, output) {
  # Data should be in the same folder as ui.R and server.R
  data <- read.csv("./OkCupidSmall.csv", stringsAsFactors=FALSE)
  
  output$heightPlot <- renderPlot({
    plot <- ggplot(data=data, aes_string(x="Height", colour=input$variable)) + 
      geom_density() +
      ggtitle(paste("Reported Height by ", input$variable)) + 
      xlab("Height (ft)") + ylab("Density") + xlim(c(4.5, 7))
    print(plot) # have to use print() for ggplot2 plots
  })
})