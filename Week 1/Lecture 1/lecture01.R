
# 5005CEM Data Science
# Live coding -- Week 1 -- Wednesday

# 1. Install R (www.r-project.org)
#    then RStudio (www.rstudio.com)

# 2. Install tidyverse packages
# install.packages('tidyverse')

library(tidyverse) # python import
starwars
View(starwars)
starwars %>% group_by(species) %>% summarise(count=n()) %>% arrange(desc(count))

mydata = tribble(~word, ~freq,
                 'gamer',20,
                 'programmer',50,
                 'musician',5)
mydata

# install.packages("wordcloud2")
library(wordcloud2)
wordcloud2(data=mydata)

# -- the end --
