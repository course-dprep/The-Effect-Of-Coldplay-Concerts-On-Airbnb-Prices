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
Mexico %>% filter(date >= "2022-04-03") %>%
  filter(date <= "2022-04-07") %>%
         ggplot(aes(x = date,
                    y = price,
                    size = distance, 
                    )) + 
           geom_point()

         

         
