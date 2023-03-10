02 - Structure of a Shiny Applet
========================================================
author: R Workshops
date: Spring 2014

A Tale of Two Files
========================================================
Shiny applets are defined by two files, **ui.R** and **server.R**.
These two files are enough to create a simple shiny applet. 

- [**ui.R**](../Code/Skeleton/ui.R) defines the page layout and user interface
- [**server.R**](../Code/Skeleton/server.R) contains the R code to create any output

ui.R
========================================================


```r
library(shiny)

# Define UI for new application
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Title"),

  sidebarPanel(),

  mainPanel()
))
```

ui.R
========================================================
- Defines the `shinyUI()` function, which contains elements that describe the HTML page
- Typical applets are constructed using the `pageWithSidebar()` function, which creates a side bar generally used for input and a main panel used for output
- Elements are hierarchical functions:  
components in the sidebar go into the `sidebarPanel()` function, separated by commas
- Input variables are named in `ui.R` and then referenced in `server.R`

server.R
========================================================

```r
library(shiny)

# Define server logic required to create application output
shinyServer(function(input, output) {

})
```

server.R
========================================================

- Defines the `shinyServer()`, which is a function with input and output variables. 
- Contains all of the R code to generate any output
- (Later) can also be used to modify inputs
- Generally much longer than `ui.R` - all the interesting stuff happens in `server.R`

Your Turn
========================================================
- Modify the Example 1 ui.R and server.R files provided on the website. 
- Change the title of the applet
- Change the default number of observations from 500 to 50
- Change the name of the plot object from "distPlot" to something else. Remember, you must change this in both the server.R and ui.R files!!!


Shiny Interactivity
========================================================

```r
library(shiny)
runExample("02_text")
```

Type | Objects | Description 
----- | ----------------- | -----------------------------------
Input | Dataset | Choose a dataset from a dropdown list
Input | # Observations | Size of the table to display
Output | Summary | summary statistics for each variable
Output | Table | First n observations of the data table

Shiny Interactivity
========================================================
left:40%
Input
- dropdown list
- numeric input

Output 
- text
- table 

***
<center>
<img src="02-ShinyStructure-figure/shiny-text.png" alt="Picture of Shiny Text Applet">
</center>

Shiny Interactivity
========================================================

Input   | Shiny UI syntax
------------- | ----------------------------------------------
dropdown list | `selectInput(inputId, label, choices, selected = NULL, multiple = FALSE)`
numeric input | `numericInput(inputId, label, value, min = NA, max = NA, step = NA)`

Output  | Shiny server.R syntax
----------- | ---------------
text | `outputId <- renderPrint(function{})`
table | `outputId <- renderTable(function{})`

Output  | Shiny ui.R syntax
----------- | ---------------
text | `verbatimTextOutput(outputId)`
table | `tableOutput(outputId)`


Reactivity
========================================================
Shiny applets work because of *reactive expressions*, which automatically update outputs when input values change. 

```
input values => R code => output values
```

**Reactive expressions** keep track of what values they read and what values they change. If those values become "out of date", they know their return value is out of date and will automatically recalculate.

Reactivity
========================================================
We can create a reactive expression by passing a normal expression into `reactive`. 


```r
datasetInput <- reactive({
   switch(input$dataset,
          "rock" = rock,
          "pressure" = pressure,
          "cars" = cars)
})
```

This statement checks to see if `input$dataset` contains "rock", "pressure", or "cars", then stores the corresponding data into the variable `datasetInput`.

Reactivity
========================================================
Reactive values can be turned into `output` objects that are passed to the shinyServer function. 

This output depends on both the dataset and the number of observations. 


```r
output$view <- renderTable({
   head(datasetInput(), n = input$obs)
})
```

Whenever either the dataset or the number of observations changes, this function will be re-executed and the output will change.

Reactivity
========================================================

```r
runExample("03_reactivity")
```

Let's take a look at the [ui.R](../Code/Applet3/ui.R) and [server.R](../Code/Applet3/server.R) files that create the applet to see the underlying code.

Your Turn
========================================================
Explore the code for the example 3 applet. 

- What is the name of the R variable that contains the dataset name?
- What reactive function controls what dataset is loaded?
- What variable contains the caption for the dataset output?
