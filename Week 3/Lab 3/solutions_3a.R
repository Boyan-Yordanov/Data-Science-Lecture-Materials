
#============
# Minilab 3a
#============

# Challenge (page 5)
library(tidyverse)
library(gapminder)
gapminder %>%
  group_by(continent,year) %>%
  summarise(num_countries=n_distinct(country),
            total_pop=sum(pop)) %>%
  ggplot(aes(x=year,y=total_pop,colour=continent)) +
  geom_line()
  
#---------------------

# Exercise (page 5) -- Starwars
# (a)
library(tidyverse)
starwars %>%
  filter(species=="Droid")
starwars %>%
  arrange(desc(mass))

# (b)
starwars %>%
  group_by(species) %>%
  summarise(count=n(),
            mean_mass=mean(mass))
  
#---------------------

# Exercise (page 6) -- Football
library(tidyverse)
myleague = "E0"
url = paste0("http://www.football-data.co.uk/mmz4281/1920/",myleague,".csv")
football = read_csv(url)

# (a)
myteam = "Wolves"
football %>%
  filter(HomeTeam==myteam | AwayTeam==myteam)
# or
result = football %>%
  filter(HomeTeam==myteam | AwayTeam==myteam)
View(result)

# (b)
football %>%
  group_by(HomeTeam) %>%
  summarise(mean_FTHG=mean(FTHG))
# or perhaps we want to sort them in descending order
football %>%
  group_by(HomeTeam) %>%
  summarise(mean_FTHG=mean(FTHG)) %>%
  arrange(desc(mean_FTHG))

# -- the end --
