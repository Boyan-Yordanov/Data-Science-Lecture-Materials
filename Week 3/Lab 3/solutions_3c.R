
#============
# Minilab 3c
#============

# Exercise (page 3) -- IMDb
# (a)
library(tidyverse)
library(rvest)
url="https://www.imdb.com/search/title/?title_type=feature&genres=sci-fi&sort=num_votes,desc&count=250&explore=genres&view=advanced"

webpage = read_html(url)
title = html_text(html_nodes(webpage, '.lister-item-header a'))
rating = html_text(html_nodes(webpage, '.ratings-imdb-rating strong'))
runtime = html_text(html_nodes(webpage, '.text-muted .runtime'))
table = tibble(title=title, rating=rating, runtime=runtime)
View(table)

# (b) The runtime is a string, e.g., "148 min".  We will need to
#     extract the number from the string, i.e., remove the " min".

# For further attributes we can extract from IMDb see https://github.com/gunasekaransengodan/Web-Scraping-in-R-with-rvest-for-Top-2016-IMDB-Cinemas/blob/master/Web%20crawling%20for%20Top%202016%20IMDB%20Films.R

#---------------------

# Exercise (page 5) -- Super Bowl
# (a)

library(tidyverse)
library(rvest)
library(lubridate)
url = "http://espn.go.com/nfl/superbowl/history/winners"
page = read_html(url)
sb_table = html_nodes(page, 'table')
sb = html_table(sb_table)[[1]]
sb = sb[c(-1,-2),]
names(sb) = c("number", "date", "site", "result")
sb = as_tibble(sb)
pattern = ' \\d+$'
result = sb %>%
  mutate(number=1:nrow(sb)) %>%
  mutate(date=mdy(date)) %>%
  separate(site,c("stadium","city",NA),sep='[()]') %>%
  separate(result,c("winner","loser"),sep=', ') %>%
  mutate(winner_score=as.numeric(str_extract(winner,pattern))) %>%
  mutate(winner=gsub(pattern,"",winner)) %>%
  # --- additional code below here and %>% above
  mutate(loser_score=as.numeric(str_extract(loser,pattern))) %>%
  mutate(loser=gsub(pattern,"",loser)) 
View(result)

# (b)
result %>%
  ggplot(aes(x=date, y=winner_score-loser_score)) +
    geom_point()

#---------------------

# Exercise (page 7) -- Dates
# (a)

library(lubridate)
tyson_fury = dmy("12/08/1988")
deontay_wilder = dmy("22/10/1985")
tyson_fury - deontay_wilder

# Output:
# Time difference of 1025 days

# (b) -- leap second
before = ymd_hms("2016-12-31 23:59:59")
after  = ymd_hms("2017-01-01 00:00:00")
after-before
# Conclusion: leap second not tracked by lubridate


#---------------------

# Challenge (page 7)

# Foo (older twin) was born first on a boat just to the 
# west of the international date line, at 12:03am on
# 1 March in a non-leap year.
# The boat then crosses the international date line from
# east to west.
# Bar (younger twin) was born 5 minutes after Foo, so at
# 12:08am on 28 Feb, on the boat just to the east of
# the international date line.
# The current year is a leap year.

# Birth
foo = ymd_hm("2021-03-01 00:03", tz="Pacific/Auckland")
foo
bar = with_tz(foo+minutes(5), tz="Pacific/Samoa")
bar
# Birthdays in a leap year
foo_birthday = round_date(foo+years(3),"day")
foo_birthday
bar_birthday = round_date(bar+years(3),"day")
bar_birthday
# and then note that 2024 is a leap year.

# -- the end --
