library(plyr)
library(ggplot2)

###############
baby <- read.csv("http://www.stat.iastate.edu/centers/CCGS/R%20workshops/03-r-format/data/baby-names.csv")

dim(baby)

head(baby)

tail(baby)

library(reshape2)

###############
# your turn
# Use stringr to extend the dataset, adding
# length of name, first letter of name, last letter of name


compare <- dcast(baby, name~sex, value.var="percent")

library(stringr)
str_trim("    hey you ")
str_split("Susan VanderPlas", " ")
names <- c("Susan VanderPlas", "Adam Loy", "Karsten Maurer")
str_split(names, " ")

first <- str_sub(names, 1, 1)

baby$perc100 <- baby$percent * 100
baby$yearsincestart <- baby$year - 1880
baby$initial <- str_sub(baby$name, 1, 1)

transform(baby,
          perc100 = percent * 100,
          yearsincestart = year - 1880,
          initial = str_sub(name, 1, 1))

###############
# your turn
# Use stringr to extend the dataset, adding
# length of name, first letter of name, last letter of name


###############
# your turn
# combine transform and ddply to get
# the rank of a name for each sex in each year


###############
# back to baseball for a bit

baseball <- ddply(baseball, .(id), transform, 
                  season = year-min(year)+1)

qplot(ab, data=baseball)

qplot(season, h/ab, data=subset(baseball, ab >= 200)) + geom_smooth()
qplot(season, geom="bar", data=subset(baseball, ab >= 200), binwidth=1)


# From previous section: 
careers <- ddply(baseball, .(id), summarise,
                 ba = mean(h/ab, na.rm=T),
                 games = sum(g, na.rm=T),
                 atbats = sum(ab, na.rm=T),
                 first = min(year),
                 last = max(year)
)  

# alternatives to top.players:
top.players <- careers$id[1:20]
top.players <- subset(careers, first > 1960)$id[1:22]



hr.rate <- ddply(baseball, .(id), function(x) {
  if (nrow(x) <= 1) return(NA)
  if (any(x$ab == 0)) return(NA)
  model <- lm(I(hr/ab) ~ I(h/ab) - 1, data=x)
  return(coef(model)[1])
})
names(hr.rate)[2] <- "hr"
qplot(hr, data=hr.rate)

top.players <- subset(hr.rate, hr >=0.2)$id


hr.rate <- ddply(baseball, .(id), function(x) {
  if (nrow(x) <= 1) return(NA)
  if (any(x$ab == 0)) return(NA)
  model <- lm(I(hr/ab) ~ I(h/ab) - 1, data=x)
  return(coef(model)[1])
})
names(hr.rate)[2] <- "hr"
qplot(hr, data=hr.rate)

top.players <- subset(hr.rate, hr >=0.2)$id

###############
# your turn - back to baby names...
# For a couple of selected names (e.g. first == ‘A’) and
# gender compute a linear model (lm) in percent over time 
# (use a second degree polynomial for time (poly(time, 2)), 
# and extract coefficients. Which names are up and coming, 
# which names are going out of fashion?


###############
# plyring variations

apropos("ply")

## Using ddply
hr.rate <- ddply(baseball, .(id), function(x) {
  if (nrow(x) <= 1) return(NA)
  if (any(x$ab == 0)) return(NA)
  model <- lm(I(hr/ab)~I(h/ab)-1, data=x)
  return(coef(model)[1])
})

# Using dlply - Returns a list
hr.rate <- dlply(baseball, .(id), function(x) {
  if (nrow(x) <= 1) return(NA)
  if (any(x$ab == 0)) return(NA)
  model <- lm(I(hr/ab)~I(h/ab)-1, data=x)
  return(model)
  #return(coef(model)[1])
})

#################
# your turn -
# Use one of the plyr commands to do each of the 
# following tasks:
#  • For a couple of selected names (e.g. first ==‘A’)
#    and gender compute and return a linear
#    model (lm) in percent over time (use a second
#    degree polynomial for time (poly(time, 2)).
#  • From the previous output, extract Rsquare
#    values, coefficients, and corresponding p-values.
#    Which names show a strong significant trend?
                                 