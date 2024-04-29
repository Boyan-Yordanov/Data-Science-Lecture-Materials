
#============
# Minilab 7a
#============

# Exercise (page 2)
punif(45,0,360) + 1-punif(315,0,360)
# [1] 0.25

#---------------------

# Exercise (page 4)
qnorm(0,100,15)
# [1] -Inf
qnorm(1,100,15)
# [1] Inf

#---------------------

# Challenge (page 4)
mu = 100
sigma = 15
prob  = seq(0,1,0.001)
value = qnorm(prob,mu,sigma)
qplot(prob,value,geom="line")

# -- the end --
