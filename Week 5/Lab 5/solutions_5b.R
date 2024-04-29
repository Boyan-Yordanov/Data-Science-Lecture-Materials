
#============
# Minilab 5b
#============

# Exercise (page 4)

library(tidyverse)
library(datarium)
marketing = as_tibble(marketing)
# Model is sales = a + b*facebook
ggplot(marketing,aes(x=facebook,y=sales)) +
  geom_point() +
  geom_smooth(method=lm, se=FALSE)
model = lm(sales~facebook, data=marketing)
summary(model)

# Fitted model:
#   sales = 11.17397 + 0.20250*facebook

# Model is sales = a + b*newspaper
ggplot(marketing,aes(x=newspaper,y=sales)) +
  geom_point() +
  geom_smooth(method=lm, se=FALSE)
model = lm(sales~newspaper, data=marketing)
summary(model)

# Fitted model:
#   sales = 14.82169 + 0.05469*newspaper

#---------------------

# Exercise (page 5)
library(tidyverse)
loading = c(3,8,10,11,13,16,27,30,35,37,38,44,103,142)
removal = c(4,7, 8, 8,10,11,16,26,21, 9,31,30, 75, 90)
wetland = tibble(loading,removal)

# (a)
ggplot(wetland,aes(x=loading,y=removal)) +
  geom_point() +
  geom_smooth(method="lm",se=FALSE)

# (b)
model = lm(removal~loading, data=wetland)
summary(model)

# Fitted model:
#   removal = 0.62614 + 0.65229*loading

# (c)
model = lm(removal~loading-1, data=wetland)
summary(model)

# Fitted model:
#   removal = 0.66057*loading
# Notice there is no intercept in this model.


# Some more advanced ideas (just for interest) ...
x = wetland$loading
y = wetland$removal

# Remember from minilab 5a:
b = sum((x-mean(x))*(y-mean(y)))/sum((x-mean(x))^2)
# > b
# [1] 0.6522902
# --> this is the multiplier in part (b)
#     no need to calculate this as lm() does all the work

# For the linear model with no intercept term:
b = sum(x*y)/sum(x^2)
# > b
# [1] 0.6605704
# --> this is the multiplier in part (c)
#     no need to calculate this as lm() does all the work

#---------------------

# Exercise (page 6)
# (a) 
model = lm(sales~youtube+facebook+newspaper, data=marketing)
summary(model)

# Fitted model:
#   sales = 3.52667 + 0.045765*youtube + 0.188530*facebook - 0.001037*newspaper

# (b)
ggplot(marketing,aes(x=youtube+facebook+newspaper,y=sales)) +
  geom_point() +
  geom_smooth(method=lm, se=FALSE)

# This gives a scatterplot where sales is on the vertical axis
# and total advertising is on the horizontal axis, i.e.,
# literally adding youtube+facebook+newspaper.
#
# This is *not* related to the fitted model in part (a).
# The line in the scatterplot would be:
#   sales = a + b*(youtube+facebook+newspaper)
# with just two model coefficients to be calculated.

# -- the end --
