library(ggplot2)

###################
# Themes
# Two built in themes.  The default:
qplot(carat, price, data = diamonds)

# And a theme with a white background:
qplot(carat, price, data = diamonds) + theme_bw()

# Use theme_set if you want it to apply to every
# future plot.
theme_set(theme_bw())

# This is the best way of seeing all the default
# options
theme_bw()
theme_grey()



################
# Plot Options
p <- qplot(carat, price, data = diamonds) + ggtitle("Price and Size of Diamonds")

# To modify a plot
p + theme(plot.title = 
  element_text(size = 12, face = "bold"))
p + theme(plot.title = element_text(colour = "red"))
p + theme(plot.title = element_text(angle = 45))
p + theme(plot.title = element_text(hjust = 1))


# If we want, we could also remove the axes:
last_plot() + theme(
  axis.text.x = element_blank(), 
  axis.text.y = element_blank(),
  axis.title.x = element_blank(), 
  axis.title.y = element_blank() 
)

last_plot() + theme(
  axis.text.x = element_blank(), 
  axis.text.y = element_blank(),
  axis.title.x = element_blank(), 
  axis.title.y = element_blank(),
  axis.ticks = element_line(colour=rgb(0,0,0,alpha=0)) 
)



####################
# Saving Plots
qplot(price, carat, data = diamonds)
ggsave("diamonds.png")

# Selects graphics device based on extension
ggsave("diamonds.png")
ggsave("diamonds.pdf")



# Uses on-screen device size, or override with 
# width & height (to be reproducible)
ggsave("diamonds.png", width = 6, height = 6)

# Outputs last plot by default, override
# with plot:
dplot <- qplot(carat, price, data = diamonds)
ggsave("diamonds.png", plot = dplot)

# Defaults to 300 dpi for png
ggsave("diamonds.png", dpi = 72)


