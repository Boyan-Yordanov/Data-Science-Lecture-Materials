
#============
# Minilab 4b
#============

# Questions (bottom of page 4)

# (7) What do you notice from this graphical plot?
# Survived by Gender
ggplot(titanic, aes(x=Gender)) +
  geom_bar(aes(fill=Survived))

# Conclusion: most females lived (blue) and most males died (pink).

titanic %>%
  group_by(Gender,Survived) %>%
  summarise(count=n())

#   Gender Survived count
#   <chr>  <fct>    <int>
# 1 female 0           81
# 2 female 1          233
# 3 male   0          468
# 4 male   1          109


# (8) What do you notice from this graphical plot?

# Survived by Pclass
ggplot(titanic, aes(x=Pclass)) +
  geom_bar(aes(fill=Survived))

# Conclusion:
#   approx 2/3 of first class lived
#   approx 1/2 of second class lived
#   approx 1/4 of third class

titanic %>%
  group_by(Pclass,Survived) %>%
  summarise(count=n())

#   Pclass Survived count
#   <fct>  <fct>    <int>
# 1 1      0           80
# 2 1      1          136
# 3 2      0           97
# 4 2      1           87
# 5 3      0          372
# 6 3      1          119


# (9) Based on this graphical plot, describe or summarise the relationship between Survived, Gender and Class.  Which bars in the plot are most striking?

# Conclusion:
#   almost all females in first/second class lived
#   almost all males in second/third class died

ggplot(titanic, aes(x=Pclass)) +
  geom_bar(aes(fill=Survived)) +
  facet_wrap(~Gender)

# Gives the bars reordered.


# (10) Does this graphical plot change your conclusions at all?

# Conclusion: Interesting to see much larger numbers of third-class males died.
# Also most young people lived.

#---------------------

# Exercise (page 6) -- diamonds

library(tidyverse)
summary(diamonds)
ggplot(diamonds,aes(x=color,y=price)) +
  geom_boxplot() +
  facet_wrap(~cut)

# Conclusion: for Very Good, Premium and Ideal diamonds, the median
# price increases with color grade (D to J) with J highest.
# Also median price is much less than maximum price.

# -- the end --
