
# 5005CEM Data Science
# Live coding -- Week 4 -- Wednesday

# More Exploratory Data Analysis

library(tidyverse)
url = 'https://raw.githubusercontent.com/mwaskom/seaborn-data/master/penguins.csv'
penguin = read_csv(url)
penguin

library(GGally)

# compare this:
ggpairs(penguin, aes(colour=species))

# with this:
ggpairs(penguin)

# -- the end --
