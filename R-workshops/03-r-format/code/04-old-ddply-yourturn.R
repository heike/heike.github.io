#####################
# your turn baby names
baby <- read.csv("http://www.hofroe.net/R%20workshops/03-r-format/data/02-data/baby-names.csv")

bnames <- ddply(baby, .(name), summarize,
	both=length(unique(sex))
)

unisex <- subset(bnames, both==2)$name

length(unisex)
length(unique(baby$name))
# about 10 percent of all names are used for both boys and girls

##########

unisex_data <- subset(baby, name %in% unisex)
uniwhen <- ddply(unisex_data, .(name, sex), summarize,
	percent = max(percent),
	year = year[which.max(percent)]
)

uni <- dcast(uniwhen, name ~ sex, value.var="percent")
qplot(boy, girl, data=uni)
qplot(boy, girl, data=uni) + 
	geom_text(aes(label=name), size=3, hjust=-.15, data=subset(uni, (boy > 0.002) & (girl > 0.002)))


mostpopular <- dcast(uniwhen, name ~ sex, value.var="year")
qplot(boy, girl, data=mostpopular)
# lots of points are on the diagonal - names are popular for both boys and girls at the same time
# there's a few names that are popular for boys now that used to be popular for girls around 1900
# there's quite a lot of names that are popular for girls now that used to be popular for boys earlier
qplot(boy, girl, data=mostpopular) + 
  geom_text(aes(label=name), size=3, hjust=-.15, data=subset(mostpopular, abs(boy-girl) > 50))

qplot(boy, girl, data=mostpopular) + 
  geom_text(aes(label=name), size=3, hjust=-.15, data=subset(mostpopular, abs(boy-girl) > 50), position="jitter")

	
#####################
# your turn baby names

library(stringr)
baby <- transform(baby,
    length = str_length(name),
	first = str_sub(name, 1, 1),
	last = str_sub(name, -1, -1)
)

#qplot(year, length, colour=sex, data=baby) + geom_smooth()
#qplot(year, first, colour=first, facets=~sex, data=names.stat) + geom_smooth()

baby <- ddply(baby, c("sex", "year"), transform, 
	rank = rank(-percent, ties.method = "first"))

#####################
#

lms <- ddply(subset(baby, first=="A"), .(name, sex), function(x) {
	if (nrow(x) < 3) return(c(n=nrow(x), NA, NA, NA))
	model <- lm(percent ~ poly(year, 2), data=x)
	c(n=nrow(x), coef(model))
})
names(lms)[4:6] <- c("Intercept", "year", "year2")
qplot(year, year2, colour=sex, data=subset(lms, n > 2)) + 
geom_text(aes(label=name), 
  data=subset(lms, (year <= -0.01) | 
                   (year2 < -0.03) |
                   (year > 0.015)))

