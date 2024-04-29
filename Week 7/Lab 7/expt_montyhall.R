
# Monty Hall problem
library(tidyverse)

monty_hall = function(switchdoor, num_replications) {

  wincount = 0
  for (i in 1:num_replications)
  {
    # Where is the car
    cardoor = rdunif(1,1,3)

    # What does the contestant select?
    selectdoor = rdunif(1,1,3)

    # Offer an door that was not selected
    if (cardoor==selectdoor)
    {
      alldoors = 1:3
      remaindoors = alldoors[-cardoor]
      offerdoor = remaindoors[rdunif(1,1,2)]
    }
    else
    {
      offerdoor = cardoor
    } 

    if (switchdoor)
    {
      if (cardoor==offerdoor)
        wincount = wincount+1
    }
    else
    {
      if (cardoor==selectdoor)
        wincount = wincount+1
    }
  }

  return(wincount/num_replications)
}

dont_switch_proportion = monty_hall(FALSE, 10000)
print(dont_switch_proportion)
switch_proportion = monty_hall(TRUE, 10000)
print(switch_proportion)

