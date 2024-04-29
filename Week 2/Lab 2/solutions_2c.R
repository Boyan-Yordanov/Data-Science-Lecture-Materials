
#============
# Minilab 2c
#============

# Exercise (page 5)
#   You really need to find out more about the varaibles before
#   trying to answer the questions.
# https://www.rdocumentation.org/packages/nycflights13/versions/1.0.1/topics/flights

#   Also read about logical operators and %in% with filter().
#     https://r4ds.had.co.nz/transform.html#filter-rows-with-filter  

library(tidyverse)
library(nycflights13)

# (a) Departed between midnight and 6am (inclusive). 
# variable: dep_time (integer HHMM)
filter(flights, dep_time>=0600)
# or to see more of the result
result = filter(flights, dep_time>=0600)
View(result)

# (b) Had an arrival delay of two or more hours. 
# variable: arr_delay (integer minutes)
result = filter(flights, arr_delay>=120)
View(result)

# (c) Flew to Houston (IAH or HOU). 
# variable: dest
result = filter(flights, dest=="IAH" | dest=="HOU")
# or
result = filter(flights, dest %in% c("IAH","HOU"))
View(result)

# (d) Were operated by United (UA), American (AA), or Delta (DL). 
# variable: carrier
result = filter(flights, carrier=="UA" | carrier=="AA" | carrier=="DL")
# or
result = filter(flights, carrier %in% c("UA","AA","DL"))
View(result)

# (e) Arrived more than two hours late, but didn't leave late. 
# variables: arr_delay, dep_delay (integer minutes)
result = filter(flights, arr_delay>=120, dep_delay<=0)
View(result)

# (f) Were delayed by at least an hour, but made up over 30 minutes in flight 
# variables: dep_delay, arr_delay (integer minutes)
result = filter(flights, dep_delay>=60, dep_delay-arr_delay>=30)
View(result)

# -- the end --
