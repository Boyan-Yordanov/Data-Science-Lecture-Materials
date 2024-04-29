
#============
# Minilab 1c
#============

# Exercise (page 2)
# (a) What happens if you specify an index that is out-of-bounds, e.g., vowels[10]?

vowels = c("a","e","i","o","u") 
vowels[10]

# The output is:
# [1] NA
# which means "not available", or missing data.
# https://www.statmethods.net/input/missingdata.html

# (b) What happens if you specify a negative index, e.g., vowels[-3]? 

vowels = c("a","e","i","o","u") 
vowels[-3]

# The output is:
# [1] "a" "e" "o" "u"
# which is the contents of the vector WITHOUT
# the item at index 3 (in this case the "i").
# Indexing starts at 1 in R and 0 in Python.

#---------------------

# Exercise (page 4)
# (a)
friends = c("Scott","Virgil","Alan","Gordon","John","Brains")
print(friends)

# (b)
life = list(
  first_name = "Mark",
  last_name = "Johnston",
  job = "Assistant Professor",
  sport = "cricket",
  age = 99
)
print(life)

# (c)
university = list(
  name = "Coventry University",
  website = "www.coventry.ac.uk",
  address = list(
    first_line = "Priory Street",
    second_line = "Coventry",
    third_line = "United Kingdom",
    postcode = "CV1 5FB"
  )
)
print(university)

# (d)
rio_olympics_100m_freestyle = list(
  gold = c("Oleksiak","Manuel"),
  bronze = "Sjostrom"
)
print(rio_olympics_100m_freestyle)

# (e)
V = c(list(a="hello",b="goodbye"),3.1415927)
print(V)

# The output is:
# $a
# [1] "hello"
# 
# $b
# [1] "goodbye"
# 
# [[3]]
# [1] 3.141593
# which shows that V is a list not a vector.

print(class(V))
# [1] "list"

# Conclusion: it is NOT possible for a vector to have
# a list as one of its elements.
# R accepts what you type but the output is a list.

# -- the end --
