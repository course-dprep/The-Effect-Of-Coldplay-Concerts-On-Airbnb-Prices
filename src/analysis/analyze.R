library(fixest)
library(broom)
library(tidyr)
library(ggplot2)

#import data 
Mexico <- read_csv("../../data/Mexico.csv")
Dallas <- read_csv("../../data/Dallas.csv")
Chicago <- read_csv("../../data/Chicago.csv")

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

         

         
