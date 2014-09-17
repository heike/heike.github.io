# Your turn 1
#===============================================

# Using apply
stateMM_base <- apply(salaries, 1, range) 
yearMM_base <- apply(salaries, 2, range)

# Using aaply
stateMM_plyr <- aaply(salaries, 1, range)
yearMM_plyr <- aaply(salaries, 2, range)

# comparing output
class(stateMM_base)
class(stateMM_plyr)

stateMM_base
head(stateMM_plyr)
#===============================================

# Your turn 2
#===============================================

# Using sweep
maxes <- apply(salaries, MARGIN = 2, max)

salaries_prop <- sweep(salaries, MARGIN = 2, maxes, FUN = "/")
head(salaries_prop)

# Using aaply
salaries_prop_plyr <- aaply(salaries, .margin = 2, 
                            function(x) x / max(x))

# Using apply
salaries_prop_base <- apply(salaries, MARGIN = 2, function(x) x / max(x))

#===============================================

# Your turn 3
#===============================================

# Trend by location

nasa$x <- factor(nasa$x)
nasa$y <- factor(nasa$y)
nasa$location <- nasa$x:nasa$y

library(MASS) # for rlm function

# Fitting rlm to assess trends
locations <- split(nasa, nasa$location)
trends <- lapply(locations, function(x) rlm(temperature ~ year + month, data = x))

# Counting locations with positive coefficient for year 
coefs_nasa <- t(sapply(trends, coef))
sum(coefs_nasa[, "year"] > 0)
# Obviously this is very naive. 
# You can think of ways to be more sophisticated 
# and incorporate uncertainty using the same tools.

# Extracting residual standard errors
rse_nasa <- sapply(trends, function(x) summary(x)$sigma)
rse_nasa <- data.frame(rse = rse_nasa, location = names(rse_nasa))
qplot(rse_nasa, geom = "histogram")

# Plotting variability to get a better idea of location
nasa_locations <- nasa[, c("location", "y", "x", "lat", "long")] # lots of redundancy
nasa_locations <- unique(nasa_locations)

plot_rse <- merge(nasa_locations, rse_nasa, by = "location")

# Looks like there is more variability in North America
qplot(x, y, data = plot_rse, geom = "tile", fill = rse) + 
  scale_fill_gradient2(low = "blue", high = "red")

#===============================================