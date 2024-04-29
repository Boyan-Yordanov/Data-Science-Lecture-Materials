
#============
# Minilab 6a
#============

# Exercise (page 6)
library(tidyverse)
library(datarium)
marketing = as_tibble(marketing)
model = lm(sales~youtube+facebook, data=marketing)
autoplot(model)

# Residuals vs Fitted
#   seems to be a high-low-high nonlinear pattern (BAD)
#   point labelled 131 is clear outlier

# Normal Q-Q
#   generally ok (GOOD)
#   point labelled 131 a concern here too

# Scale-Location
#   points seem to be more spread out vertically
#   in the middle (A BIT BAD)

# Residuals vs Leverage
#   shows clear outlier (labelled 131)
#   generally ok for leverage

#---------------------

# Exercise (page 8)
r = cor(marketing$sales, marketing$youtube)
# > r
# [1] 0.7822244
# > r^2
# [1] 0.6118751

#---------------------

# Exercise (page 9)
model = lm(sales~youtube, data=marketing)
summary(model)
# R^2 = 0.6119

model = lm(sales~facebook+newspaper, data=marketing)
summary(model)
# R^2 = 0.3327

# We would consider the sales~youtube model to be a
# better model (higer R^2 value), i.e., youtube is
# a better predictor of sales than facebook and
# newspaper together.

# -- the end --
