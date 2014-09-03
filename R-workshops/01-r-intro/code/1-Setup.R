# Day 1 setup.
install.packages(c("ggplot2", "reshape2"), repos = "http://streaming.stat.iastate.edu/CRAN/")

tmp <- options()
options(warn = -1)
if(require(ggplot2) & require(reshape2)){
    plot.new()
    text(.5, .5, "Everything worked!")
    print("Everything worked. You're set for the session")
}else{
    plot.new()
    text(.5, .6, "You need to install some packages")
    text(.5, .4, "See the R console for details")
    cat(rep("\n", 30))
    cat("Go to the following site and follow the directions there\n")
    cat("http://streaming.stat.iastate.edu/workshops/r-intro/#yourown\n")
}
options(tmp)
rm(tmp)

