library(shiny)

# Define UI for new application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("OkCupid Data"),
  
  sidebarPanel(
    # add inputs here
    selectInput("variable", "Select categorical variable", choices=c("gender", "orientation", "status", "Smokes", "Drinks", "Drugs", "Religion", "Sign"), selected="gender")
    ),
  
  mainPanel(
    # add outputs here
    plotOutput("heightPlot")
    )
))