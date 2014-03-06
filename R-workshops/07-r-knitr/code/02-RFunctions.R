# Slide 3
library(xtable)
data(iris)
xtable(head(iris))

# Slide 4
?xtable
?print.xtable
print(xtable(head(iris), caption="Iris dataset included with R"), 
      include.rownames=FALSE, size="footnotesize")

# Your Turn

# (do this in the Rnw file, not in the code file!!)