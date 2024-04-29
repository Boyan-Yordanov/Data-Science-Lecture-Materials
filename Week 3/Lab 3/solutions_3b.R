
#============
# Minilab 3b
#============

# Exercise (page 5) -- NYC Flights
library(tidyverse)
library(nycflights13)

# (a)
# variables: origin, dest, air_time
result = flights %>%
  filter(origin=="JFK", dest=="SEA") %>%
  summarise(average_air_time=mean(air_time, na.rm=TRUE),
            min_air_time=min(air_time, na.rm=TRUE),
            max_air_time=max(air_time, na.rm=TRUE))
View(result)

# and then compare with
flights %>%
  filter(origin=="JFK", dest=="SEA") %>%
  ggplot(aes(y=air_time)) +
    geom_boxplot()

# (b)
# Find average_speed in descending order
result = flights %>%
  group_by(dest) %>%
  summarise(average_speed=mean(distance/air_time, na.rm=TRUE)) %>%
  arrange(desc(average_speed))
View(result)

# now isolate the maximum
flights %>%
  group_by(dest) %>%
  summarise(average_speed=mean(distance/air_time, na.rm=TRUE)) %>%
  filter(average_speed==max(average_speed, na.rm=TRUE))

# but we want the airport name
flights %>%
  group_by(dest) %>%
  summarise(average_speed=mean(distance/air_time, na.rm=TRUE)) %>%
  filter(average_speed==max(average_speed, na.rm=TRUE)) %>%
  left_join(airports,by=c("dest"="faa")) %>%
  select(name)

#---------------------

# Exercise (page 5) -- Diamonds
# (a)
library(tidyverse)
diamonds %>%
  group_by(cut) %>%
  summarise(count=n(),
            min_price=min(price),
            median_price=median(price),
            max_price=max(price))

# compare with
diamonds %>%
  ggplot(aes(x=cut, y=price)) +
    geom_boxplot()
# which is the same as
ggplot(diamonds,aes(x=cut, y=price)) +
  geom_boxplot()

 
# (b)
diamonds %>%
  group_by(color) %>%
  summarise(mean_ppc=mean(price/carat)) %>%
  filter(mean_ppc==max(mean_ppc))

# compare with
diamonds %>%
  group_by(color) %>%
  summarise(mean_ppc=mean(price/carat)) %>%
  ggplot(aes(x=color, y=mean_ppc)) +
    geom_col()

# -- the end --
