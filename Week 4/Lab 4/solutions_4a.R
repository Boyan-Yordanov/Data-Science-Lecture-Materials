
#============
# Minilab 4a
#============

# Questions (top of page 3)

# (2)
# Anscombe' quartet: **first** dataset
library(tidyverse)
x = anscombe[,1]
y = anscombe[,5]
summary(x)
sd(x)
summary(y)
sd(y)
cor(x,y)

# > summary(x)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#     4.0     6.5     9.0     9.0    11.5    14.0 
# > sd(x)
# [1] 3.316625
# > summary(y)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#   4.260   6.315   7.580   7.501   8.570  10.840 
# > sd(y)
# [1] 2.031568
# > cor(x,y)
# [1] 0.8164205

# Anscombe' quartet: **second** dataset
x = anscombe[,2]
y = anscombe[,6]
summary(x)
sd(x)
summary(y)
sd(y)
cor(x,y)

# > summary(x)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#     4.0     6.5     9.0     9.0    11.5    14.0 
# > sd(x)
# [1] 3.316625
# > summary(y)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#   3.100   6.695   8.140   7.501   8.950   9.260 
# > sd(y)
# [1] 2.031657
# > cor(x,y)
# [1] 0.8162365

# Conclusion: first and second Anscombe datasets have ...
#   same mean of x (9.0)
#   same mean of y (7.501)
#   (nearly) same mean of x (3.317 to 3dp)
#   (nearly) same mean of y (2.032 to 3dp)
#   (nearly) same correlation coefficient (0.816 to 3dp)


ggplot(NULL,aes(x=x,y=y)) +
  geom_point()

# Conclusion: Points are clearly curved (nonlinear).

# (3)
# Anscombe' quartet: **third** dataset with one point removed
x = anscombe[-3,3]
y = anscombe[-3,7]
ggplot(NULL,aes(x=x,y=y)) +
  geom_point()
cor(x,y)

# > cor(x,y)
# [1] 0.9999966
# Conclusion: perfect straight line


# (4)
x = anscombe[,4]
y = anscombe[,8]
ggplot(NULL,aes(x=x,y=y)) +
  geom_point()

# Clear outlier
# > x
# [1]  8  8  8  8  8  8  8 19  8  8  8
  
# Outlier corresponds to x=19 which is at index 8
# (indexing of vectors in R starts at 1)
x = anscombe[-8,4]
y = anscombe[-8,8]
ggplot(NULL,aes(x=x,y=y)) +
  geom_point()
cor(x,y)

# > cor(x,y)
# [1] NA
# Warning message:
# In cor(x, y) : the standard deviation is zero

# Conclusion: Points all lie on a vertical line but the 
# Pearson correlation formula breaks down since it tries
# to divide by zero.

#---------------------

# Exercise (page 4) -- Diamonds

library(tidyverse)
diamonds %>%
  group_by(cut) %>%
  summarise(count=n(),
            cor_carat_price=cor(carat,price))
	    
# Conclusion: highest correlation is for Ideal cut.

#---------------------

# Exercise (page 6) -- Decathlon

# (a)
# cor(hurdles,longjump) = -0.39
#     makes sense (minimise time, maximise distance).
# cor(discus,longjump) = -0.13
#     does *NOT* make sense (maximise both), tradeoff strength vs speed
# cor(hurdles,points) = -0.54
#     makes sense (award more points for a shorter time to run)

# (b)
# The winner is the athlete with the highest points, i.e., the dot
# on the extreme right of the scatterplots in the points column.
# So the winner (Ashton Eaton) was:
#   best jump in the long jump (largest distance),
#   second in the hurdles (low time),
#   but middling in the field for discus.

# -- the end --
