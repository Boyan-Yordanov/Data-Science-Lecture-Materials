
#============
# Minilab 6b
#============

# Exercise (page 4)
library(tidyverse)
library(ISLR)
credit = as_tibble(Credit)
credit = select(credit,Balance,Limit,Income)

ggplot(credit, aes(x=Income,y=Balance)) +
  geom_point() +
  geom_smooth(method="lm",se=FALSE)
model = lm(Balance~Income, data=credit)
summary(model)
model$coefficients

# Fitted model:
#   Balance = 246.5148 + 6.0484*Income
#   R^2 = 0.215
#     worse than for Balance~Limit (R^2=0.7425)

#---------------------

# Exercise (page 5)
credit = as_tibble(Credit)
credit = select(credit,Balance,Limit,Income,Rating,Age)

model = lm(Balance~Rating, data=credit)
summary(model)
# R^2=0.7458

model = lm(Balance~Age, data=credit)
summary(model)
# R^2=3.368e-06 (=0.000003368)

model = lm(Balance~Rating+Age, data=credit)
summary(model)
# R^2=0.7535

# The best of these models (highest R^2)is
#   Balance~Rating+Age

#---------------------

# Exercise (page 9) -- smoking

# (a)
library(tidyverse)
babies = read_tsv("birthsmokers.tsv")

# (b)
ggplot(babies, aes(x=gestation,y=weight)) +
  geom_point(aes(colour=smoking)) +
  geom_smooth(method="lm",se=FALSE)

# The line is the line-of-best-fit for the whole
# dataset. It is striking that most pink dots
# are above (mother does NOT smoke) and most
# blue dotes are below (mother DOES smoke).

# (c)
model = lm(weight~gestation, data=babies)
summary(model)
# weight = -2037.00 + 130.82*gestation
# R^2 = 0.7752

model = lm(weight~gestation+smoking, data=babies)
summary(model)

# for mothers who do NOT smoke: 
#   weight = -2389.573 + 143.100*gestation
# for mothers who DO smoke:
#   weight = (-2389.573-244.544) + 143.100*gestation
# R^2 = 0.8964 

# The second model has higher R^2 (better model).

# Conclusion: If the mother smokes then the baby
# weight falls by 244grams on average below the
# baby weight if the mother does not smoke.

# (d)
model = lm(weight~gestation*smoking, data=babies)
summary(model)
# (Notice the * instead of +.)
# This model includes the "interaction effect",
# considers effect of smoking on both intercept
# and multiplier.

# A little bit more (bonus):
#
#   Note that the model in part (c) only considers
#   effect of smoking on the intercept.
#
# for mothers who do NOT smoke:
#   weight = -2546.138 + 147.207*gestation
# for mothers who DO smoke:
#   weight = (-2546.138+71.574) + (147.207-8.178)*gestation

# -- the end --
