
#============
# Minilab 8b
#============

# Exercise (page 2) -- Galapagos Islands

# (a)  In the scatter matrix (ggpairs) look for correlation
#      coefficients with stars in the top row (Species)
#
# Species v Endemics
# Species v Area
# Species v Elevation

# Yes, corr.test() does provide the same information.

library(psych)
corr.test(gala)

# Probability values
# (here the entries on or above the diagonal have been removed)
#
#           Species Endemics Area Elevation Nearest Scruz Adjacent
# Species
# Endemics     0.00
# Area         0.00     0.00
# Elevation    0.00     0.00 0.00
# Nearest      0.94     0.97 0.56      0.95
# Scruz        0.37     0.42 0.60      0.94    0.00
# Adjacent     0.89     0.66 0.34      0.00    0.54  0.79


# (b) 
model = lm(Species~Area+Elevation+Nearest+Scruz+Adjacent,data=gala)
summary(model)
# Look for the stars in the output.

# Call:
# lm(formula = Species ~ Area + Elevation + Nearest + Scruz + Adjacent, 
#     data = gala)
# 
# Residuals:
#      Min       1Q   Median       3Q      Max 
# -111.679  -34.898   -7.862   33.460  182.584 
# 
# Coefficients:
#              Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  7.068221  19.154198   0.369 0.715351    
# Area        -0.023938   0.022422  -1.068 0.296318    
# Elevation    0.319465   0.053663   5.953 3.82e-06 ***
# Nearest      0.009144   1.054136   0.009 0.993151    
# Scruz       -0.240524   0.215402  -1.117 0.275208    
# Adjacent    -0.074805   0.017700  -4.226 0.000297 ***
# ---
# Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 60.98 on 24 degrees of freedom
# Multiple R-squared:  0.7658,	Adjusted R-squared:  0.7171 
# F-statistic:  15.7 on 5 and 24 DF,  p-value: 6.838e-07

# Conclusion: Predictors that are not significant are
# Area, Nearest, and Scruz

# Suggested model
model = lm(Species~Elevation+Adjacent,data=gala)
summary(model)

# Call:
# lm(formula = Species ~ Elevation + Adjacent, data = gala)
# 
# Residuals:
#     Min      1Q  Median      3Q     Max 
# -103.41  -34.33  -11.43   22.57  203.65 
# 
# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  1.43287   15.02469   0.095 0.924727    
# Elevation    0.27657    0.03176   8.707 2.53e-09 ***
# Adjacent    -0.06889    0.01549  -4.447 0.000134 ***
# ---
# Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 60.86 on 27 degrees of freedom
# Multiple R-squared:  0.7376,	Adjusted R-squared:  0.7181 
# F-statistic: 37.94 on 2 and 27 DF,  p-value: 1.434e-08


# Note (for interest) that the R^2 value reduces but both
# predictors are significant.

# -- the end --
