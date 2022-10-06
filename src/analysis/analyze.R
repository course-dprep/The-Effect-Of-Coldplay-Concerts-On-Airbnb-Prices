library(fixest)
library(broom)
library(tidyr)
library(ggplot2)
library(readr)

#create directories for graphs and regressions 
dir.create('../../gen/Dallas')
dir.create('../../gen/Mexico')
dir.create('../../gen/Chicago')

#import data 
Mexico_cleaned <- read_csv("../../data/Mexico/Mexico_cleaned.csv")
Dallas_cleaned <- read_csv("../../data/Dallas/Dallas_cleaned.csv")
Chicago_cleaned <- read_csv("../../data/Chicago/Chicago_cleaned.csv")

#run regressions 
Dallas_reg <-   feols(price ~ distance + 
                  accommodates + DuringConcert, 
                  data = Dallas_cleaned)
tidy(Dallas_reg, conf.int = TRUE)

Chicago_reg <-   feols(price ~ distance + 
                        accommodates + DuringConcert, 
                      data = Chicago_cleaned)
tidy(Chicago_cleaned, conf.int = TRUE)

Mexico_reg <-   feols(price ~ distance + 
                        accommodates + DuringConcert, 
                      data = Mexico_cleaned)
tidy(Mexico_cleaned, conf.int = TRUE)

#save regressions 
fwrite(Dallas_reg, file = "../../gen/Dallas_reg")
fwrite(Mexico_reg, file = "../../gen/Mexico_reg")
fwrite(Chicago_reg, file = "../../gen/Chicago_reg")

#create graph with mean price for Dallas
Dallas_graph <- Dallas_cleaned %>% 
  filter(date >= "2022-04-06") %>%
  filter(date <= "2022-06-06") %>%
  summarize(mean_price = mean(price)) %>%
    ggplot(aes(x = date, y = mean_price)) + 
  geom_line(color = 'blue')
print(Dallas_graph)

Dallas_point_graph <- Dallas_cleaned %>%
  filter(date >= "2022-04-06") %>%
  filter(date <= "2022-06-06") %>%
  ggplot(aes(x=date, y=price, group=DuringConcert))+
  geom_point(aes(color=DuringConcert))
print(Dallas_point_graph)

#create graph with mean price for Mexico
Mexico_graph <- Mexico_cleaned %>% group_by(date) %>%
  summarize(mean_price = mean(price)) %>%
  filter(DuringConcert == 1) %>%
  filter(distance <= 25) %>%
  ggplot(aes(x = date, y = mean_price)) + 
  geom_line(color = 'blue')
print(Mexico_graph)

fwrite(Dallas_graph, file = "../../gen/Dallas_graph")
fwrite(Mexico_graph, file = "../../gen/Mexico_graph")
fwirte(Chicago_graph, file = "../../gen/Chicago_graph" )
         
