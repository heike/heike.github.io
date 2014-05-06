# your turn 
set.seed(20120605)
frame <- data.frame(x=runif(25), y=runif(25), g1=rep(c("A","B"), c(12,13)), g2=rep(c("1", "2"), c(13,12)))

qplot(x,y, shape=g1, colour=g2, data=frame, size=I(4))

#####
# solution - e.g.
qplot(x,y, colour=interaction(g1,g2), data=frame, size=I(4))

# with additional colour schemes:
qplot(x,y, colour=interaction(g1,g2), shape=g2, data=frame, size=I(4)) + scale_colour_brewer(palette="Paired")


###############
# your turn

data(diamonds)
qplot(carat, price, shape=cut, colour=clarity, data=diamonds)

qplot(carat, price, 
      colour=cut, data=diamonds) + 
        scale_colour_brewer(palette="Oranges") +
        scale_y_log10() + scale_x_log10() + facet_wrap(~clarity)

qplot(carat, price, 
      colour=color, data=diamonds) + 
  scale_colour_brewer() +
  scale_y_log10() + scale_x_log10() + facet_grid(clarity~cut)


###############
# your turn
# Explore the differences in length, rating, etc. in movie genres over time
movies <- read.csv("http://www.stat.iastate.edu/centers/CCGS/R%20workshops/02b-r-graphics/data/MovieSummary.csv")

# Short movies aren't always as short as they seem... Romances are really long. 
ggplot(data=movies) + geom_density(aes(x=length, fill=genre)) + facet_wrap(~genre, scales="free")

# Action movies are generally mediocre
ggplot(data=movies) + geom_density(aes(x=rating, fill=genre)) + facet_wrap(~genre)

# The 1980s didn't have a lot of animated movies
ggplot(data=movies) + geom_density(aes(x=year, fill=genre)) + facet_wrap(~genre)

# Of movies that are more than an hour, there are fewer badly rated movies in most categories before 1950. 
ggplot(data=subset(movies, length>60 & genre!="Short")) + geom_point(aes(x=year, y=rating), alpha=.2) + facet_wrap(~genre, scales="free_y")
