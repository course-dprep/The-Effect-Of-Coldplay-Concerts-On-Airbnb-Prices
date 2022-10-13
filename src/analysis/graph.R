#code for measuring distance 
library(ggplot2)
library(readr)
library(dplyr)

#create directory
dir.create('../../gen/graph')
dir.create('../../gen/graph/Dallas')
dir.create('../../gen/graph/Chicago')
dir.create('../../gen/graph/Mexico')


Mexico_cleaned <- read_csv("../../data//Mexico/Mexico_cleaned.csv")
Dallas_cleaned <- read_csv("../../data/Dallas/Dallas_cleaned.csv")
Chicago_cleaned <- read_csv("../../data/Chicago/Chicago_cleaned.csv")

#############Dallas####################
#create graph with mean price for Dallas
pdf(file = '../../gen/graph/Dallas/Dallas_mean_price_graph.pdf')
Dallas_cleaned %>% filter(distance <= 50) %>% 
  group_by(date) %>%
  summarize(mean_price = mean(price)) %>%
  ggplot(aes(x = date, y = mean_price)) + 
  geom_line(color = 'blue') + 
  geom_hline(yintercept = mean(Dallas_cleaned$price), color="red")
dev.off()
  # create graph with differences in price for different distances on the date of the concert for Dallas
pdf('../../gen/graph/Dallas/Dallas_distance_price_graph.pdf')
ggplot(Dallas_cleaned %>% filter(price < 9999) %>% 
           filter(DuringConcert), mapping = aes(distance, price)) + geom_point(aes(size = price, alpha = 0, colour = "red")) + 
  geom_hline(yintercept = mean(Dallas_cleaned$price, na.rm=TRUE))
dev.off()

# create bar graph with differences in price for different room types for Dallas
pdf('../../gen/graph/Dallas/Dallas_room_type_graph.pdf')
Dallas_cleaned %>% 
  filter(DuringConcert) %>% filter(price < 9999) %>% ggplot(aes(x = room_type, y = mean(price))) + 
  geom_bar(stat = "identity", fill = 'red')
dev.off()

#############Mexico####################
#create graph with mean price for mexico
pdf('../../gen/graph/Mexico/Mexico_mean_price_graph.pdf')
Mexico_cleaned %>% filter(distance <= 50) %>% 
  group_by(date) %>%
  summarize(mean_price = mean(price)) %>%
  ggplot(aes(x = date, y = mean_price)) + 
  geom_line(colour = 'green') + 
  geom_hline(yintercept = mean(Mexico_cleaned$price), colour="black")
dev.off()

# create graph with differences in price for different distances on the date of the concert for Mexico
pdf('../../gen/graph/Mexico/Mexico_distance_price_graph.pdf')
ggplot(Mexico_cleaned %>% filter(price < 9999) %>% 
           filter(DuringConcert), mapping = aes(distance, price)) + geom_point(aes(size = price, colour = 'green', alpha = 0)) + 
  geom_hline(yintercept = mean(Mexico_cleaned$price, na.rm=TRUE))
jpeg('../../gen/graph/Mexico/Mexico_distance_price_graph.jpeg')
dev.off()

# create bar graph with differences in price for different room types for Mexico
pdf('../../gen/graph/Mexico/Mexico_room_type_graph.pdf')
 Mexico_cleaned %>% 
  filter(DuringConcert) %>% filter(price < 9999) %>% ggplot(aes(x = room_type, y = mean(price))) + 
  geom_bar(stat = "identity", fill = 'green')
dev.off()

###########Chicago########################
#create graph with mean price for Chicago
pdf('../../gen/graph/Chicago/Chicago_mean_price_graph.pdf')
Chicago_cleaned %>% filter(distance <= 50) %>% 
  group_by(date) %>%
  summarize(mean_price = mean(price)) %>%
  ggplot(aes(x = date, y = mean_price)) + 
  geom_line(colour = 'blue') + 
  geom_hline(yintercept = mean(Chicago_cleaned$price), colour="black")
dev.off()

# create graph with differences in price for different distances on the date of the concert for Chicago
pdf('../../gen/graph/Chicago/Chicago_distance_price_graph.pdf')
ggplot(Chicago_cleaned %>% filter(price < 9999) %>% 
           filter(DuringConcert), mapping = aes(distance, price)) + geom_point(aes(size = price, colour = "blue", alpha = 0)) + 
  geom_hline(yintercept = mean(Chicago_cleaned$price, na.rm=TRUE))
dev.off()

# create bar graph with differences in price for different room types for Chicago
pdf('../../gen/graph/Chicago/Chicago_room_type_graph.pdf')
Chicago_cleaned %>% 
  filter(DuringConcert) %>% filter(price < 9999) %>% ggplot(aes(x = room_type, y = mean(price))) + 
  geom_bar(stat = 'identity', fill = 'blue')
dev.off()



