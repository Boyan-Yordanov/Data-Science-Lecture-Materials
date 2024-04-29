
#============
# Minilab 2a
#============

# Exercise (page 4)
library(tidyverse)
tennis = tribble( 
  ~name, ~rank, ~age, ~height, ~weight, ~gender, 
  #--------------|---|---|----|---|----| 
  "Nadal",          1, 33, 1.85, 85, "M", 
  "Djokovic",       2, 32, 1.88, 77, "M", 
  "Federer",        3, 38, 1.85, 85, "M", 
  "Medvedev",       4, 23, 1.98, 83, "M", 
  "Theim",          5, 26, 1.85, 79, "M", 
  "Tsitsipas",      6, 21, 1.93, 89, "M", 
  "Zverev",         7, 22, 1.98, 90, "M", 
  "Berrettini",     8, 23, 1.96, 95, "M", 
  "Bautista Agut",  9, 31, 1.83, 75, "M", 
  "Monfils",       10, 33, 1.93, 85, "M", 
  "Barty",          1, 23, 1.66, 62, "F",  
  "Pliskova",       2, 27, 1.86, 72, "F", 
  "Halep",          3, 28, 1.68, 60, "F", 
  "Osaka",          4, 22, 1.80, 69, "F", 
  "Svitolina",      5, 25, 1.74, 60, "F", 
  "Andreescu",      6, 19, 1.70, 60, "F", 
  "Bencic",         7, 22, 1.75, 63, "F", 
  "Kvitova",        8, 29, 1.82, 68, "F", 
  "Williams",       9, 38, 1.75, 72, "F", 
  "Bertens",       10, 28, 1.82, 74, "F" 
)

# (a) 
ggplot(tennis, aes(x=gender, y=age)) + 
  geom_boxplot()

# On a boxplot an OUTLIER is shown as a dot.
# Looking back at the dataset
View(tennis)
# the outlier is "Williams", i.e., Serena Williams
# who is 38 (in this dataset).

# (b)
ggplot(tennis, aes(x=gender, y=age)) + 
  geom_boxplot() +
  coord_flip()

# Gives HORIZONTAL boxplots.

# (c) BMI is weight/(square of height)

ggplot(tennis, aes(x=gender, y=weight/(height^2))) + 
  geom_boxplot()

# From https://en.wikipedia.org/wiki/Body_mass_index
#   under 18.5 is "underweight"
#   18.5 to 25 is "normal"
#   25 to 30 is "overweight"
#   over 30 is "obese"
# Conclusion: all tennis players is this dataset
# are "normal" weight

#---------------------

# Exercise (page 6)
# (a)

library(tidyverse)
D = tribble(
  ~country,  ~year, ~value,
  #-----------------------
  "Algeria",  2000,  7,
  "Algeria",  2001,  9,
  "Brazil",   2000, 12,
  "Brazil",   2001, 14,
  "Colombia", 2000, 16,
  "Colombia", 2001, 18
)
print(D)

# (b)
pivot_wider(D,names_from="year",values_from="value")

# The output is:
# # A tibble: 3 x 3
#   country  `2000` `2001`
#   <chr>     <dbl>  <dbl>
# 1 Algeria       7      9
# 2 Brazil       12     14
# 3 Colombia     16     18

# (c)
pivot_wider(D,names_from="country",values_from="value")

# The output is:
# # A tibble: 2 x 4
#    year Algeria Brazil Colombia
#   <dbl>   <dbl>  <dbl>    <dbl>
# 1  2000       7     12       16
# 2  2001       9     14       18

# -- the end --
