
#============
# Minilab 2b
#============

# Exercise (page 2)
# ICC Test Cricket
# https://www.kaggle.com/veeralakrishna/icc-test-cricket-runs?select=ICC+Test+Batting+Figures.csv

# RStudio |
#   Session menu |
#   Set Working Directory |
#   To Source File Location

library(tidyverse)
D = read_csv("ICC Test Batting Figures.csv")
ggplot(D,aes(y=Mat)) +
  geom_boxplot()
filter(D,Mat>150)

# -- the end --
