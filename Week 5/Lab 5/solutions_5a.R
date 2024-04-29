
#============
# Minilab 5a
#============

# Exercise (page 6)
for (b in seq(0.4,0.6,0.05)) {
  a = mean(y)-b*mean(x)
  residuals = y-(a+b*x)
  SSR = sum(residuals^2)
  cat(b,SSR,'\n')
}

# 0.4  14.86469 
# 0.45 14.03869 
# 0.5  13.76269 
# 0.55 14.03669 
# 0.6  14.86069 

for (b in seq(0.45,0.55,0.01)) {
  a = mean(y)-b*mean(x)
  residuals = y-(a+b*x)
  SSR = sum(residuals^2)
  cat(b,SSR,'\n')
}

# 0.45 14.03869 
# 0.46 13.93949 
# 0.47 13.86229 
# 0.48 13.80709 
# 0.49 13.77389 
# 0.5  13.76269 
# 0.51 13.77349 
# 0.52 13.80629 
# 0.53 13.86109 
# 0.54 13.93789 
# 0.55 14.03669 

# Conclusion: the value of b that gives the smallest SSR
#   is between 0.49 and 0.51

#---------------------

# Exercise (page 7) -- wetland
library(tidyverse)
loading = c(3,8,10,11,13,16,27,30,35,37,38,44,103,142)
removal = c(4,7, 8, 8,10,11,16,26,21, 9,31,30, 75, 90)
wetland = tibble(loading,removal)
x = loading
y = removal

# (a)
ggplot(wetland, aes(x=loading, y=removal)) +
  geom_point(size=4)
b_rough = max(removal)/max(loading)
# > b_rough
# [1] 0.6338028

# (b)
b = 1
a = mean(y)-b*mean(x)
residuals = y-(a+b*x)
ggplot(NULL,aes(x=x,y=y)) +
  geom_point(size=4) +
  geom_abline(intercept=a,slope=b) +
  geom_rect(aes(xmin=x,xmax=x-residuals,
                ymin=y,ymax=y-residuals),
                fill="green",alpha=0.5) +
  coord_fixed() +
  xlim(0,200) +
  ylim(0,150)
SSR = sum(residuals^2)
SSR

for (b in seq(1,0.5,-0.05)) {
  a = mean(y)-b*mean(x)
  residuals = y-(a+b*x)
  SSR = sum(residuals^2)
  cat(b,SSR,'\n')
}

# 1     2810.357 
# 0.95  2164.843 
# 0.9   1619.344 
# 0.85  1173.859 
# 0.8    828.3886 
# 0.75   582.933 
# 0.7    437.4921 
# 0.65   392.0659 
# 0.6    446.6543 
# 0.55   601.2573 
# 0.5    855.875 

for (b in seq(0.7,0.6,-0.01)) {
  a = mean(y)-b*mean(x)
  residuals = y-(a+b*x)
  SSR = sum(residuals^2)
  cat(b,SSR,'\n')
}

# 0.7  437.4921 
# 0.69 420.4057 
# 0.68 407.3199 
# 0.67 398.2346 
# 0.66 393.15 
# 0.65 392.0659 
# 0.64 394.9824 
# 0.63 401.8995 
# 0.62 412.8172 
# 0.61 427.7354 
# 0.6  446.6543 

# Conclusion: the value of b that gives the smallest SSR
#   is between 0.64 and 0.66

#---------------------

# Exercise (page 8) -- wetland
library(tidyverse)
loading = c(3,8,10,11,13,16,27,30,35,37,38,44,103,142)
removal = c(4,7, 8, 8,10,11,16,26,21, 9,31,30, 75, 90)
wetland = tibble(loading,removal)
x = loading
y = removal

b = sum((x-mean(x))*(y-mean(y)))/sum((x-mean(x))^2)
a = mean(y)-b*mean(x)
# > b
# [1] 0.6522902
# > a
# [1] 0.6261405

# Conclusion: the line of best fit is
#   removal = 0.6261405 + 0.6522902*loading

#---------------------

# Exercise (page 7) -- cars
# (a)
library(tidyverse)
ggplot(cars, aes(x=speed, y=dist)) +
  geom_point() +
  labs(title="Stopping distances of 1920s cars",
  x="Speed (mph)",
  y="Distance (feet)")
b_rough = max(cars$dist)/max(cars$speed)
# > b_rough
# [1] 4.8

# (b)
cor(cars$speed,cars$dist)
# or
x = cars$speed
y = cars$dist
cor(x,y)

# [1] 0.8068949
# Conclusion: strong positive relationship

# (c)
b = sum((x-mean(x))*(y-mean(y)))/sum((x-mean(x))^2)
a = mean(y)-b*mean(x)
b
a
> b
[1] 3.932409
> a
[1] -17.57909

# Fitted model:
#   dist = -17.57909 + 3.932409 * speed

# Stopping distance increase by approximately 3.9 feet for
# one mph increase in speed.  Remember these are 1920s cars.

# -- the end --
