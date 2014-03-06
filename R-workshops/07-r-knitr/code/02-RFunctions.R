# Xtable Examples
library(xtable)
data(iris)
xtable(head(iris))

# Xtable Options
?xtable
?print.xtable
print(xtable(head(iris), caption="Iris dataset included with R"), 
      include.rownames=FALSE, size="footnotesize")

# Your Turn

# (do this in the Rnw file, not in the code file!!)

# stargazer Examples

x <- seq(0, 10, .5)
y <- x+rnorm(length(x))
data <- data.frame(x=x, y=y)

model <- lm(y~x)
library(stargazer)
stargazer(model)

?stargazer

intercept.model <- lm(y~x, data=data)
nointercept.model <- lm(y~0+x, data=data)

stargazer(intercept.model, nointercept.model, float=F, single.row=TRUE, 
          font.size="scriptsize", object.names=T, model.numbers=F)