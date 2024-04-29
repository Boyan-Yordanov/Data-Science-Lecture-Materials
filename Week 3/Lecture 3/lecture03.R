
# 5005CEM Data Science
# Live coding -- Week 3 -- Wednesday

# Exploratory Data Analysis

# Penguins:
#   https://github.com/mwaskom/seaborn-data/blob/master/penguins.csv

library(tidyverse)
url = 'https://raw.githubusercontent.com/mwaskom/seaborn-data/master/penguins.csv'
penguin = read_csv(url)
penguin

summary(penguin)
# NA is missing data (not available)

# How many rows in dataset?
summarise(penguin, count=n())
# -- answer is a tibble (tidyverse is tibble in, tibble out)

AAA = group_by(penguin, sex)
summarise(AAA, count=n())

BBB = group_by(penguin, island)
summarise(BBB, count=n(), av_bill_len=mean(bill_length_mm, na.rm=TRUE))

ggplot(penguin, aes(y=bill_length_mm)) +
  geom_boxplot()

# -- the end --
