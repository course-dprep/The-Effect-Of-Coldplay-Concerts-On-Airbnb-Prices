#shape of the regression test 

install.packages('fixest')
install.packages('broom')
library(fixest)
library(broom)
library(tidyr)

reg1 <-   feols(price ~ distance + 
                  accommodates,
              data = MexicoDuringConcert)
tidy(reg1, conf.int = TRUE)



