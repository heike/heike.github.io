### R code from vignette source '3Basics.Rnw'

###################################################
### code chunk number 1: Calculator
###################################################
# Addition
2 + 2
# Subtraction
15 - 7
# Multiplication
109*23452
# Division
3/7


###################################################
### code chunk number 2: Fancy Calculator
###################################################
# Integer division
7 %/% 2
# Modulo operator (Remainder)
7 %% 2
# Powers
1.5^3

#Roots
sqrt(25)
25^.5
25^(1/2)

# e
exp(1)

# e^2
exp(2)
#or
exp(1)^2

#if so desired
e <- exp(1)
e^2

#logarithms

#log gives natural log
log(exp(2))

#log10 gives log base 10
log10(100)

#log base 2
log2(10)

#Can't do it for every base
log3(10) #gives error

log(10,base = 3)

pi
sin(pi)
cos(pi)
tan(pi)

sign(2)
sign(-2)
abs(-2)

floor(2.579)
floor(-2.579)
ceiling(2.579)
ceiling(-2.579)
trunc(2.579)
trunc(-2.579)
round(2.579)
round(-2.579)
round(-2.579, digits = 2)
signif(2.579, 2)
signif(23511,2)

.Last.value

###################################################
### Variable Storage
###################################################
2bad <- 3 # this doesn't work!

# R is case sensitive
aA <- 3
Aa <- 4
aa <- 5
aa == aA

for <- 10 # R won't let you use the variable name "for" because it is reserved

c <- 10 ### this is super-bad practice... now how do you define a vector?
c(1, 2, 3) ### It still works, but this can cause weird errors!
rm("c") ### get rid of  "c" and everything goes back to normal.

MyAge <- 25
MyHeight = "5ft4in"
LoveForPuppies = Inf
170 -> RightSideAssignment ## This is hard to read!!

1/sqrt(2*pi)*exp(0) # combine functions to get crazy math

normaldensity <- .Last.value # super useful!!!

vec <- c(1, 2, 3) # define a vector


###################################################
### code chunk number 3: dBasics
###################################################
data(tips, package="reshape2")
(bill <- head(tips$total_bill))
log(bill)
bill[2]
sum(bill)
(bill_in_euros <- bill * .7982)


###################################################
### Your Turn: Iris data dimensions and use of rep
###################################################







###################################################
### code chunk number 4: dVectors
###################################################
a <- 1:6
a

b <- c(3, 4, 5, 1, 6, 2)
b[3]
b[6]

tip <- tips$tip
bill <- tips$total_bill
head(tip)


###################################################
### code chunk number 5: dIndexing
###################################################
head(tip)
tip[1]
c(1, 3, 5)
tip[c(1, 3, 5)]
tip[1:5]



###################################################
### code chunk number 6: dHF
###################################################
min(tip)
which.min(tip)
tip[which.min(tip)]
size <- tips$size
which.min(size)
which(size == min(size))
size[which(size == min(size))]

###################################################
### code chunk number 7: dCommonOps
###################################################
head(tip * 100)
head(bill * 0.18)
head(round(bill * .18, 2))
rate <- tip/bill
head(rate)


###################################################
### code chunk number 8: dIndexing1.5
###################################################
x <- c(2, 3, 5, 7)
x[c(T, F, F, T)]
x > 3.5
x[x > 3.5]
x[c(T, F)]


###################################################
### code chunk number 9: dBooleans
###################################################
head(rate)
sad_tip <- rate < 0.10
head(sad_tip)
rate[sad_tip]


###################################################
### code chunk number 10: dIndexing2
###################################################
x <- bill[1:5]
x
x[1]
x[1] <- 20
x


###################################################
### code chunk number 11: dVectors1.5
###################################################
head(rate)
rate[sad_tip] <- ":-("
head(rate)


###################################################
### code chunk number 12: dDataTypeb
###################################################
library(reshape2)


###################################################
### code chunk number 13: dDataTypeC
###################################################
str(tips)


###################################################
### code chunk number 14: dDataType
###################################################
size <- head(tips$size)
size
as.character(size)
as.numeric("2")
as.factor(size)


###################################################
### code chunk number 15: dSummary
###################################################
size <- tips$size
summary(size)
summary(as.character(size))
summary(as.factor(size))


###################################################
### code chunk number 16: dBasicStats
###################################################

(n <- length(tip))
(meantip <- sum(tip)/n)
(standdev <- sqrt( sum( (tip-meantip)^2 ) / (n-1) ) )


###################################################
### code chunk number 17: dBasicStats2
###################################################

mean(tip)
sd(tip)
summary(tip)
quantile(tip, c(.025, .975))



###################################################
### code chunk number 18: dDistributions
###################################################
# Density - prepend with 'd'
dnorm(0, mean = 0, sd = 1)
# CDF - prepend with 'p'
pnorm(2)
# Inverse CDF - prepend with 'q'
qnorm(.975)
# Random deviates - prepend with 'r'
rnorm(5)


###################################################
### code chunk number 19: dGrabOpts
###################################################
j <- options()$digits


###################################################
### code chunk number 20: dComparisons
###################################################
2 == 2
sqrt(2)^2
sqrt(2)^2 == 2
options(digits = 22)
sqrt(2)^2


###################################################
### code chunk number 21: dComparisons2
###################################################
sqrt(2)^2 == 2
all.equal(sqrt(2)^2, 2)
options(digits = 22)
2^64
2^64 - 1
# Uh oh!  The 'gmp' or 'int64' packages provides better 
# integer precision if needed.


###################################################
### code chunk number 22: dResetOpts
###################################################
options(digits=j)


###################################################
### code chunk number 23: dLogicalOp
###################################################
c(T, T, F, F) & c(T, F, T, F)
c(T, T, F, F) | c(T, F, T, F)
# Which are big bills with a poor tip rate?
id <- (bill > 40 & rate < .10)
tips[id,]


###################################################
### Your Turn: Diamonds data and t-tests
###################################################

