
#============
# Minilab 8a
#============

# Exercise (page 4) -- fill in the table

#-----------------------------
# z	failure   prob
#-----------------------------
# 2.5   0.01709   0.0124 (4dp)
# 2.0	0.05337   0.0455 (4dp)
# 1.5	0.14191   0.1336 (4dp)
# 1.0	0.31988   0.3173 (4dp)
# 0.5   0.61959   0.6171 (4dp)
#-----------------------------

# Conclusion: failure and prob approximately equal

# Alternative a,b,n:
z = 2    # magic value
a = 5
b = 95
n = 30
# Result: failure is 0.05521

# and same with n = 60
# Result: failure is 0.04986

# So no change to the conclusion.

#---------------------

# Exercise (page 5)

# 99% confidence interval
alpha = 0.01
qnorm(1-alpha/2,0,1)
# [1] 2.575829

# 90% confidence interval
alpha = 0.1
qnorm(1-alpha/2,0,1)
# [1] 1.644854

#---------------------

# Exercise (page 7)

alpha = 0.03
mu = 10
sigma = 20
n = 7

# Result: failure is 0.02985

#---------------------

# Exercise (page 10)

t.test(state$Income, conf.level=0.90)

#    One Sample t-test
# 
# data:  state$Income
# t = 51.045, df = 49, p-value < 2.2e-16
# alternative hypothesis: true mean is not equal to 0
# 90 percent confidence interval:
#  4290.109 4581.491
# sample estimates:
# mean of x 
#    4435.8 

# Gives a 90% confidence interval: (4290.109,4581.491)
# (not a 95% confidence interval)

# Null hypothesis: population mean Income is 0

# -- the end --
