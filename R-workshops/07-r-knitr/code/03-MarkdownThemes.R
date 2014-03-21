
# knitrBootstrap - shows theming options available. 

# simply run this function before compiling your document - you can also just save it to a file named .Rprofile in your working directory and R will find it.

# using chooser=c("boot", "code") 

options(rstudio.markdownToHTML =
          function(inputFile, outputFile) {
            library(knitrBootstrap)
            knit_bootstrap_md(input=inputFile, output=outputFile, chooser=c("boot", "code"), show_code=FALSE)
          }
)


# You can also specify a specific theme and remove the theme chooser: 
# options(rstudio.markdownToHTML =
#           function(inputFile, outputFile) {
#             library(knitrBootstrap)
#             knit_bootstrap_md(input=inputFile, output=outputFile, boot_style="cerulean", code_style="sunburst")
#           }
# )