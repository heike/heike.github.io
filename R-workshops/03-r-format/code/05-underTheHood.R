# Preliminaries
library(plyr)
library(lme4) # for lmList
library(MASS) # for rlm

# apply & aaply
# ======================================================

load(file.choose())
load("data/05-data/teacherSalaries.rda")
ls()

head(salaries)
str(salaries)

# row/column means
rmeans <- rowMeans(salaries)
str(rmeans)
head(rmeans)

cmeans <- colMeans(salaries)

# now with aaply
aaply(.data = salaries, .margins = 2, .fun = mean)

# now with apply
apply(X = salaries, MARGIN = 2, FUN = mean)

# sweeping
# ======================================================

# calculate the column medians
ymeds <- apply(salaries, 2, median)

# We want to subtract medians from each column
# We could use a for loop
adj <- matrix(NA, nrow = dim(salaries)[1], 
              ncol = dim(salaries)[2], 
              dimnames = dimnames(salaries))
for(i in 1:dim(salaries)[2]){
  adj[,i] <- salaries[,i] - ymeds[i]
}

# Since we already have the medians, we can use sweep
swept <- sweep(salaries, MARGIN = 2, ymeds, FUN = "-")

# We could also use aaply or apply and ignore the fact
# that we already calculated the medians.
adj_plyr <- aaply(salaries, .margin = 2, function(x) x - median(x))
adj_base <- apply(salaries, MARGIN = 2, function(x) x - median(x))


# tapply
# ======================================================

# loading wages data
load("wages.rda")

head(wages)
str(wages)
summary(wages)

head(table(wages$id), 10)

# Finding mean unemployment rate (ue) for experienced
# by each respondent

# using ddply
avgUE_plyr <- ddply(wages, .(id), summarise, avgUE = mean(uerate))

# using tapply
avgUE <- tapply(wages$uerate, wages$id,  mean)


# lapply, dlply, and by
# ======================================================
# There are (at least) three ways to fit a regression 
# model for each respondent.

sepLM <- lmList(lnw ~ exper | id, data = wages)
class(sepLM)

sepLM_alt1 <- dlply(wages, .(id), 
                    function(x) lm(lnw ~ exper, data = x))
class(sepLM_alt1)

sepLM_alt2 <- by(data = wages, INDICES = wages$id, 
                 function(x) lm(lnw ~ exper, data = x))
class(sepLM_alt2)

# Delving into lmList/dlply
# Split
sepDF <- split(wages, wages$id)

# Apply (fit model)
fitLM <- lapply(sepDF, function(x) lm(lnw ~ exper, data = x))

# A loop to do the same thing as lapply
fitLM_loop <- vector("list", length(sepDF))
for(i in seq(1, length(sepDF))){
  df <- sepDF[[i]]
  fitLM_loop[[i]] <- lm(lnw ~ exper, data = df)
}

### Extracting elements from a list of models
# using lapply
coefs <- lapply(fitLM, coef)
class(coefs)
coefs[1:3]

# if we don't want a list, we can combine them
coefs <- do.call(rbind, coefs)

# using sapply (a wrapper for lapply)
coefs_alt <- t(sapply(fitLM, coef))
class(coefs)
head(coefs_alt1)

### Recap - putting it all together
# using plyr
sepLM_plyr <- dlply(wages, .(id), function(x) lm(lnw ~ exper, data = x)) # Split, apply
coefs_plyr <- ldply(sepLM_plyr, coef) # Apply, combine

# using the apply family
sepDF <- split(wages, wages$id) # Split
sepLM <- lapply(sepDF, function(x) lm(lnw ~ exper, data = x)) # Apply
coefs <- t(sapply(sepLM, coef)) # Apply, combine

# NASA data
# ======================================================
load("nasaData.rda")
head(nasa)
str(nasa)
summary(nasa)

library(ggplot2)
library(maps)

# FYI - mapping the positions (not important for this session)
outlines <- as.data.frame(map("world", plot = FALSE,
                              xlim = -c(113.8, 56.2), ylim = c(-21.2, 36.2))[c("x","y")])
map <- geom_path(aes(x, y), inherit.aes = FALSE, data = outlines, 
                 alpha = 0.4, show_guid = FALSE)
qplot(x = long, y = lat, data = nasa) + map