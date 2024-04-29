
# 5005CEM Data Science
# Live coding -- Week 2 -- Wednesday

# 1. Make sure you have completed Minilabs
#    1a/1b/1c from last week.

# 2. Tibble (tidy table)
#    Import data (readr library)
#    Data wrangling (dplyr library)

# install.packages("babynames")
# USA baby names 1880-2017

library(tidyverse)
library(babynames)

# Number of rows and column names
nrow(babynames)
colnames(babynames)

# Total babies of each name/sex
babynames %>%
  group_by(name,sex) %>%
  summarise(total=sum(n)) %>%
  arrange(desc(total))

# Try changing my_name and my_sex ("M" or "F") below
my_name = "Mary"
my_sex = "F"
babynames %>%
  filter(name==my_name,sex==my_sex) %>%
  ggplot(aes(x=year,y=n)) +
  geom_line() +
  ggtitle(paste("Popularity of",my_name,"(",my_sex,")"))

# -- the end --
