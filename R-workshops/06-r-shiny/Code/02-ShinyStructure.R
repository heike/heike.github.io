### Applet 2 - Verbatim Text Output and Table Output

library(shiny)
runExample("02_text")

### Applet 3 - Reactive Expressions (Title, Verbatim Text, and Table Output)
runExample("03_text")

# Analyzing the reactive function
datasetInput <- reactive({
  switch(input$dataset,
         "rock" = rock,
         "pressure" = pressure,
         "cars" = cars)
})

input <- list()
input$dataset <- "rock" # set the input value

switch(input$dataset,
       "rock" = rock,
       "pressure" = pressure,
       "cars" = cars)
# switch statement outputs the "rock" dataset

# non-reactive version: 
datasetInput <- {
  switch(input$dataset,
         "rock" = rock,
         "pressure" = pressure,
         "cars" = cars)
}

head(datasetInput)


