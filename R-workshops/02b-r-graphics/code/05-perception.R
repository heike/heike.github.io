library (ggplot2)


###################
# aesthetics & pre-attentive features
qplot(runif(25), runif(25), size=I(4)) + geom_point(aes(runif(1), runif(1)), colour="grey60", size=I(4)) + coord_fixed(ratio=1) + theme_bw()


qplot(runif(5), runif(5), size=round(4*runif(5))) + theme(legend.position="none") + coord_fixed(ratio=1)+ theme_bw()

qplot(factor(1:5), runif(5), geom="bar") + theme(legend.position="none")+ theme_bw()

qplot(1:6,rep(1,6), shape=factor(1:6), size=I(7)) + theme(legend.position="none")+ theme_bw()

qplot(1:6,rep(1,6), colour=factor(1:6), size=I(7)) + theme(legend.position="none")+scale_colour_brewer(palette="Set1")+ theme_bw()

qplot(1:6,rep(1,6), colour=factor(1:6), size=I(7)) + theme(legend.position="none")+scale_colour_brewer()+ theme_bw()


####################
# your turn
set.seed(20120605)
frame <- data.frame(x=runif(25), y=runif(25), g1=rep(c("A","B"), c(12,13)), g2=rep(c("1", "2"), c(13,12)))

qplot(x,y, shape=g2, 
      colour=g1, 
      data=frame, size=I(4))+ theme_bw()

qplot(x,y, shape=g2, 
      colour=interaction(g1,g2), 
      data=frame, size=I(4))+ theme_bw()

####################
# colour schemes

install.packages(RColorBrewer)
library(RColorBrewer)
help(package=RColorBrewer)

display.brewer.all()

# now apply colour schemes
data(tips, package="reshape")
qplot(total_bill, tip, data=tips, 
      colour=sex)+ theme_bw()
qplot(total_bill, tip, data=tips, 
      colour=sex) + 
        scale_colour_brewer(palette="Set1")+ theme_bw()

levels(tips$smoker)
qplot(total_bill, tip, data=tips, 
      colour=sex:smoker, size = I(3)) + 
        scale_colour_brewer(palette="Paired")+ theme_bw()

# continuous example: colour by percentage
qplot(total_bill, tip, data=tips, 
      shape=sex, colour=tip/total_bill) + theme_bw()

# we don't like blues?
qplot(total_bill, tip, data=tips, 
      shape=sex, colour=tip/total_bill) + 
        scale_colour_gradient(low="pink", 
                              high="purple") + theme_bw()
# don't go completely crazy!

# continuous example: colour by deviation from mean percentage
qplot(total_bill, tip, data=tips, 
      shape=sex, colour=tip/total_bill-mean(tip/total_bill)) +
  theme_bw()

# we should change the colour scheme
qplot(total_bill, tip, data=tips, 
      shape=sex, colour=tip/total_bill-mean(tip/total_bill)) +
  scale_colour_gradient2()+ theme_bw()

qplot(total_bill, tip, data=tips, 
      shape=sex, 
      colour=sqrt(tip/total_bill), 
      size=I(4)) + 
        scale_colour_gradient2(midpoint=mean(with(tips, sqrt(tip/total_bill))))+ theme_bw()

qplot(total_bill, tip, data=tips, shape=sex, colour=sqrt(tip/total_bill), size=I(4)) + scale_colour_gradient2(mid="grey90",midpoint=mean(with(tips, sqrt(tip/total_bill)))) + theme_bw()


####################
# your turn

data(diamonds)
qplot(carat, price, colour=cut, data=diamonds, alpha=I(.25)) + 
  facet_wrap(~clarity) + 
  scale_colour_brewer(palette="YlOrRd")


####################
# facetting

data(tips, package="reshape")

qplot(price, carat, data=diamonds,  facets = . ~ color)
qplot(price, carat, data=diamonds,  facets = cut ~ color)

# wrapping
qplot(price, carat, data=diamonds,  facets = ~ color + cut)

qplot(price, carat, data=diamonds,  facets = cut ~ color, color=clarity) + scale_y_log10() + scale_x_log10() + scale_colour_brewer(palette="YlGn") 

qplot(price, carat, data=diamonds,  facets = cut ~ color, color=clarity) + scale_y_log10() + scale_x_log10() + scale_colour_brewer(palette="YlGn") + geom_smooth(method="lm", fill=NA)

# very advanced - uses layering system
ggplot(aes(x=price, y=carat, color=clarity), data=diamonds) +
  facet_grid(cut ~ color, ) + scale_y_log10() + scale_x_log10() + scale_colour_brewer(palette="YlGr") + geom_smooth(method="lm", fill=NA, size=2)


# Last your turn
# Explore the differences in length, rating, etc. in movie genres over time

movies <- read.csv("http://heike.github.io/R-workshops/02b-r-graphics/data/MovieSummary.csv")

# Just to get you started
qplot(data=movies, x=length, fill=genre, geom="density") + facet_wrap(~genre, scales="free")
