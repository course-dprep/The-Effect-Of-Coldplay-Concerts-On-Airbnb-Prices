#shape of the regression test 

install.packages('fixest')
install.packages('broom')
library(fixest)
library(broom)
library(tidyr)
library(ggplot2)

reg1 <-   feols(price ~ distance + 
                  accommodates + DuringConcert, 
                  data = Mexico)
tidy(reg1, conf.int = TRUE)


#create graph with price 
Mexico %>% ß
  fil
         ggplot(aes(x = date,
                    y = price,
                    size = price, 
                    )) + 
           geom_point()

         

         
range(Mexico$date, asc)



