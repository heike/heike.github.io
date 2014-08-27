library(ggplot2)

data(diamonds)
qplot(carat, price, data=diamonds)

qplot(carat, price, data=diamonds) # colour

qplot(carat, log10(price), data=diamonds) # transform axis
qplot(carat, price, data=diamonds) + scale_y_log10() # transform axis


qplot(carat, price, data=diamonds, alpha=I(0.05), size=I(3), colour=I("darkblue")) + scale_y_log10() # transform axis

qplot(carat, price, data=diamonds, alpha=I(0.05), size=I(3), colour="darkblue") + scale_y_log10() # transform axis

qplot(carat, price, data=diamonds, alpha=I(0.05), size=I(3), colour=color) + scale_y_log10() # transform axis



qplot(carat, price, data=diamonds, alpha=I(0.05)) + scale_y_log10() # transform axis

qplot(carat, price, data=diamonds, alpha=I(0.05), size=I(3)) + scale_y_log10() # transform axis


# histograms

# boxplot

qplot(cut, price, geom="boxplot", data=diamonds) + scale_y_log10()


data(Titanic)
titanic <- as.data.frame(Titanic)
qplot(Class, data=titanic)
qplot(Class, data=titanic, weight=Freq)
qplot(Class, data=titanic, weight=Freq, fill=Survived)
qplot(Survived, data=titanic, weight=Freq, facets=~Class)
qplot(Survived, data=titanic, weight=Freq, facets=Sex~Class)

# going beyond
library(productplots)
prodplot(titanic, Freq~Survived+Sex|Class)
prodplot(titanic, Freq~Survived+Sex|Class) + aes(colour=Survived)

library(GGally)
ggpairs(titanic, weight="Freq", colour="Survived")
