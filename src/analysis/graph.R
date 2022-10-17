#code for measuring distance 
library(ggplot2)
library(readr)
library(dplyr)
library(ggpubr)

#create directory
dir.create('../../gen/output')
dir.create('../../gen/output/graph')
dir.create('../../gen/output/graph/Dallas')
dir.create('../../gen/output/graph/Chicago')
dir.create('../../gen/output/graph/Mexico')


Mexico_cleaned <- read_csv("../../data/Mexico/Mexico_cleaned.csv")
Dallas_cleaned <- read_csv("../../data/Dallas/Dallas_cleaned.csv")
Chicago_cleaned <- read_csv("../../data/Chicago/Chicago_cleaned.csv")

#############Dallas####################
#create graph with mean price for Dallas
Dallas_mean_price_graph <- Dallas_cleaned %>% filter(distance <= 50) %>% 
  group_by(date) %>%
  summarize(mean_price = mean(price)) %>%
  ggplot(aes(x = date, y = mean_price)) + 
  geom_line(color = 'blue') + 
  geom_hline(yintercept = mean(Dallas_cleaned$price), color="red")

# create graph with differences in price for different distances on the date of the concert for Dallas
Dallas_distance_price_graph <- ggplot(Dallas_cleaned %>% filter(price < 9999) %>% 
           filter(DuringConcert), mapping = aes(distance, price)) + geom_point(aes(size = price, alpha = 0, colour = "red")) + 
  geom_hline(yintercept = mean(Dallas_cleaned$price, na.rm=TRUE))

# create bar graph with differences in price for different room types for Dallas
Dallas_room_type_graph <- Dallas_cleaned %>% 
  filter(DuringConcert) %>% filter(price < 9999) %>% ggplot(aes(x = room_type, y = mean(price))) + 
  geom_bar(stat = "identity", fill = 'red')


#############Mexico####################
#create graph with mean price for mexico
Mexico_mean_price_graph <- Mexico_cleaned %>% filter(distance <= 50) %>% 
  group_by(date) %>%
  summarize(mean_price = mean(price)) %>%
  ggplot(aes(x = date, y = mean_price)) + 
  geom_line(colour = 'green') + 
  geom_hline(yintercept = mean(Mexico_cleaned$price), colour="black")

# create graph with differences in price for different distances on the date of the concert for Mexico
Mexico_distance_price_graph <- ggplot(Mexico_cleaned %>% filter(price < 9999) %>% 
           filter(DuringConcert), mapping = aes(distance, price)) + geom_point(aes(size = price, colour = 'green', alpha = 0)) + 
  geom_hline(yintercept = mean(Mexico_cleaned$price, na.rm=TRUE))

# create bar graph with differences in price for different room types for Mexico
Mexico_room_type_graph <- Mexico_cleaned %>% 
  filter(DuringConcert) %>% filter(price < 9999) %>% ggplot(aes(x = room_type, y = mean(price))) + 
  geom_bar(stat = "identity", fill = 'green')

###########Chicago########################
#create graph with mean price for Chicago
Chicago_mean_price_graph <- Chicago_cleaned %>% filter(distance <= 50) %>% 
  group_by(date) %>%
  summarize(mean_price = mean(price)) %>%
  ggplot(aes(x = date, y = mean_price)) + 
  geom_line(colour = 'blue') + 
  geom_hline(yintercept = mean(Chicago_cleaned$price), colour="black")

# create graph with differences in price for different distances on the date of the concert for Chicago
Chicago_distance_price_graph <- ggplot(Chicago_cleaned %>% filter(price < 9999) %>% 
           filter(DuringConcert), mapping = aes(distance, price)) + geom_point(aes(size = price, colour = "blue", alpha = 0)) + 
  geom_hline(yintercept = mean(Chicago_cleaned$price, na.rm=TRUE))


# create bar graph with differences in price for different room types for Chicago
Chicago_room_type_graph <- Chicago_cleaned %>% 
  filter(DuringConcert) %>% filter(price < 9999) %>% ggplot(aes(x = room_type, y = mean(price))) + 
  geom_bar(stat = 'identity', fill = 'blue')


ggexport(Chicago_mean_price_graph, Chicago_distance_price_graph, Chicago_room_type_graph, filename = '../../gen/output/graph/Chicago/Chicago_plots.pdf')
ggexport(Dallas_mean_price_graph, Dallas_distance_price_graph, Dallas_room_type_graph, filename = '../../gen/output/graph/Dallas/Dallas_plots.pdf')
ggexport(Mexico_mean_price_graph, Mexico_distance_price_graph, Mexico_room_type_graph, filename = '../../gen/output/graph/Mexico/Mexico_plots.pdf')
