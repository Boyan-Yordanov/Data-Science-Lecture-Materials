
#============
# Minilab 1a
#============

# Exercise (page 4)
n = 10
sum = 0
for (i in 1:n)
  sum = sum + i
print(sum)
check = n*(n+1)/2
print(check)

#---------------------

# Challenge (page 4)
n = 10
sum = 0
for (i in 1:n)
  sum = sum + i^3
print(sum)
# Formula: https://mathschallenge.net/library/number/sum_of_cubes
check = (n*(n+1)/2)^2
print(check)

# -- the end --
