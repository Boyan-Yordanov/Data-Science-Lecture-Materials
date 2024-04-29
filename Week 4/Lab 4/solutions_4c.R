
#============
# Minilab 4c
#============

# Exercise (page 5)
# (a) Histogram

library(tidyverse)
c = ggplot(mpg, aes(hwy))
c + geom_histogram(binwidth=5)

library(gapminder)
ggplot(gapminder, aes(lifeExp)) +
  geom_histogram(binwidth=5)

# Further study: https://www.r-graph-gallery.com/histogram.html

# (b) Boxplot
f = ggplot(mpg, aes(class,hwy))
f + geom_boxplot()

ggplot(gapminder, aes(pop)) +
  geom_boxplot()

# Further study: https://www.r-graph-gallery.com/boxplot.html

# (c) Two categorical variables
g = ggplot(diamonds, aes(cut,color))
g + geom_count()

# This is a kind of scatterplot for categorical variables

# -- the end --
