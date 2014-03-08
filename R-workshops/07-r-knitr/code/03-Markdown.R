library(xtable)

# xtable and Markdown

data(iris)
print(xtable(head(iris)), type="html")
