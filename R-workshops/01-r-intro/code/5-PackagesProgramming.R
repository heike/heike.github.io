
install.packages("plyr")

library(plyr)
library(help="plyr")
help(package="plyr")

?vignette
vignette(package="plyr")
vignette()
vignette(package="xtable")

?ddply

browseURL("http://cran.r-project.org/web/views/")

library(sos)
findFn("robust regression")


### Functions

addtwo <- function(x){
    return(x + 2)
}

mydata <- 1:10
addtwo(mydata)

mymean <- function(dat){
    ans <- sum(dat)/length(dat)
    return(ans)
}

mymean(mydata)
mean(mydata)
ans

mymean <- function(dat){
    if(!is.numeric(dat)){
        warning("Numeric input is required")
        return(NA)
    }
    ans <- sum(dat)/length(dat)
    return(ans)
}

if(TRUE){
    print("this is true")
}else{
    print("this is false")
}

for(i in 1:10){
    print(i)
}

data(tips)

id <- c("total_bill", "tip", "size")
for (colname in id) {
    print(colname)
}

for (colname in id) {
    print(paste(colname, mymean(tips[, colname])))
}

i <- 1
while(i <= 5){
    print(i)
    i <- i+1
}

?mtcars
head(mtcars)

out <- rep(0, ncol(mtcars))
for (i in seq(ncol(mtcars))) {
    out[i] <- mean(mtcars[, i])
}
out

apply(mtcars, 2, mean)

apply(mtcars, 1, mean)

### Your turn

myfun <- function(dat){
    mn <- mean(dat)
    out <- t.test(dat)
    ci <- out$conf.int
    ans <- c(ci[1], mn, ci[2])
    return(ans)
}