#code for measuring distance 
library(ggplot2)

Mexico_cleaned <- read_csv("../../data//Mexico/Mexico_cleaned.csv")
Dallas_cleaned <- read_csv("../../data/Dallas/Dallas_cleaned.csv")
Chicago_cleaned <- read_csv("../../data/Chicago/Chicago_cleaned.csv")

# Dallas 

#create graph with mean price 
Dallas_graph <- Dallas_cleaned %>% filter(distance <= 50) %>% 
  group_by(date) %>%
  summarize(mean_price = mean(price)) %>%
  ggplot(aes(x = date, y = mean_price)) + 
  geom_line(color = 'blue') + 
  geom_hline(yintercept = mean(Dallas_cleaned$price), color="red")
print(Dallas_graph)

# create graph with differences in price for different distances on the date of the concert

Dallas_point_graph_distance <-
  ggplot(Dallas_cleaned %>% filter(DuringConcert), mapping = aes(distance, price)) + geom_point(aes(color = date))
print(Dallas_point_graph_distance)

# create bar graph with differences in price for different room types

Dallas_bar_graph_room_type <- 
  ggplot(data = Dallas_cleaned %>% filter(DuringConcert), aes(x=room_type, y=price)) +
  geom_bar(stat="identity", fill = 'steelblue')
print(Dallas_bar_graph_room_type)

# Mexico

#create graph with mean price
Mexico_graph <- Mexico_cleaned %>% filter(distance <= 50) %>% 
  group_by(date) %>%
  summarize(mean_price = mean(price)) %>%
  ggplot(aes(x= date, y= mean_price)) + 
  geom_line(color = 'blue') + 
  geom_hline(yintercept = mean(Mexico_cleaned$price), color="red")
print(Mexico_graph)

# create graph with differences in price for different distances on the date of the concert

Mexico_point_graph_distance <-
  ggplot(Mexico_cleaned %>% filter(DuringConcert), mapping = aes(distance, price)) + geom_point(aes(color = date))
print(Mexico_point_graph_distance)

# create bar graph with differences in price for different room types

Mexico_bar_graph_room_type <- 
  ggplot(data = Mexico_cleaned %>% filter(DuringConcert), aes(x=room_type, y=price)) +
  geom_bar(stat="identity", fill = 'steelblue')
print(Mexico_bar_graph_room_type)

# Chicago

#create graph with mean price 
Chicago_graph <- Chicago_cleaned %>% filter(distance <= 50) %>% 
  group_by(date) %>%
  summarize(mean_price = mean(price)) %>%
  ggplot(aes(x= date, y= mean_price)) + 
  geom_line(color = 'blue') + 
  geom_hline(yintercept = mean(Chicago_cleaned$price), color="red")
print(Chicago_graph)

# create graph with differences in price for different distances on the date of the concert

Chicago_point_graph_distance <-
  ggplot(Chicago_cleaned %>% filter(DuringConcert), mapping = aes(distance, price)) + geom_point(aes(color = date))
print(Chicago_point_graph_distance)

# create bar graph with differences in price for different room types

Chicago_bar_graph_room_type <- 
  ggplot(data = Chicago_cleaned %>% filter(DuringConcert), aes(x=room_type, y=price)) +
  geom_bar(stat="identity", fill = 'steelblue')
print(Chicago_bar_graph_room_type)

