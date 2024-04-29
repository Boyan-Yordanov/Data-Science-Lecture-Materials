
#============
# Minilab 7b
#============

# Exercise (page 2)
n = 36000
rollsA = rdunif(n,1,6)
rollsB = rdunif(n,1,6)
rolls_sum = rollsA + rollsB
table(rolls_sum)

mydata = tibble(rolls_sum)
ggplot(mydata,mapping=aes(x=rolls_sum)) +
  geom_bar()

# rolls_sum
#    2    3    4    5    6    7    8    9   10   11   12 
#  983 2032 2999 3964 5025 6046 5041 3940 2999 2000  971 

expected_counts = (n/36)*c(1,2,3,4,5,6,7,6,5,4,3,2,1)
expected_counts

#  [1] 1000 2000 3000 4000 5000 6000 7000 6000 5000 4000 3000 2000 1000

#---------------------

# Exercise (page 3)

# expt_double_six.R
# from 10000 trials

# > summary(x)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#    2.00   13.00   30.00   41.89   57.00  386.00 
   
# expt_six_five.R
# from 10000 trials

# > summary(x)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#    2.00   12.00   26.00   36.18   50.00  321.00 

# Conclusion:
#     six then six (on average 42 rolls)
#     six then five (on average 36 rolls)
#
# See https://datagenetics.com/blog/march92020/index.html
# for a formal explanation.

#---------------------

# Exercise (page 3) -- snakes and ladders

# From 10000 trials (games of snakes and ladders):

#   winner count
#   <chr>  <int>
# 1 A       5504
# 2 B       4496

# Conclusion: probability first player wins is 0.5504

# Start player B on locationB=1 gives P(first player wins)=0.5338
#                   locationB=2                            0.5076
#                   locationB=3                            0.5029
#                   locationB=4                            0.4880
#                   locationB=5                            0.4956
#                   locationB=6                            0.4344

# Note that the probability of first player winning might not
# reduce as locationB increases due to randomness and the
# locations of the snakes and ladders.
# For this board, it seems that starting second player on square
# number 5 makes for a very even game.

# -- the end --
