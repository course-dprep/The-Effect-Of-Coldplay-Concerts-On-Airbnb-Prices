#code for measuring distance 
library(ggplot2)

Mexico_cleaned <- read_csv("../../data//Mexico/Mexico_cleaned.csv")
Dallas_cleaned <- read_csv("../../data/Dallas/Dallas_cleaned.csv")
Chicago_cleaned <- read_csv("../../data/Chicago/Chicago_cleaned.csv")

#create graph with mean price for Dallas
Dallas_graph <- Dallas_cleaned %>% filter(distance <= 50) %>% 
  filter(date >= "2022-04-06") %>%
  filter(date <= "2022-06-06") %>%
  group_by(date) %>%
  summarize(mean_price = mean(price)) %>%
  ggplot(aes(x = date, y = mean_price)) + 
  geom_line(color = 'blue') + 
  geom_hline(yintercept = mean(Dallas_cleaned$price), color="red")
print(Dallas_graph)

Dallas_point_graph <- Dallas_cleaned %>%
  filter(date >= "2022-04-06") %>%
  filter(date <= "2022-06-06") %>%
  summarise(mean_price = mean(price)) %>%
  ggplot(aes(x= date, y= mean_price)) +
  geom_point()
print(Dallas_point_graph)

Dallas_cleaned %>% filter(price < 9999) %>% 
  filter(date >= "2022-04-06") %>%
  filter(date <= "2022-06-06") %>%
  ggplot(Dallas_cleaned, mapping = aes(date, price)) + geom_point(aes(color = distance))

#create graph with mean price for Mexico
Mexico_graph <- Mexico_cleaned %>% filter(distance <= 50) %>% 
  filter(date >= "2022-03-03") %>%
  filter(date <= "2022-05-07") %>%
  group_by(date) %>%
  summarize(mean_price = mean(price)) %>%
  ggplot(aes(x= date, y= mean_price)) + 
  geom_line(color = 'blue') + 
  geom_hline(yintercept = mean(Mexico_cleaned$price), color="red")
print(Mexico_graph)

Mexico_point_graph <- Mexico_cleaned %>%
  filter(date >= "2022-03-03") %>%
  filter(date <= "2022-05-07") %>%
  summarise(mean_price = mean(price)) %>%
  ggplot(aes(x= date, y= mean_price)) +
  geom_point()
print(Mexico_point_graph)

Mexico_cleaned %>% filter(price < 9999) %>% 
  filter(date >= "2022-03-03") %>%
  filter(date <= "2022-05-07") %>%
  ggplot(Mexico_cleaned, mapping = aes(date, price)) + geom_point(aes(color = distance))

#create graph with mean price for Chicago
Chicago_graph <- Chicago_cleaned %>% filter(distance <= 50) %>% 
  filter(date >= "2022-04-28") %>%
  filter(date <= "2022-06-29") %>%
  group_by(date) %>%
  summarize(mean_price = mean(price)) %>%
  ggplot(aes(x= date, y= mean_price)) + 
  geom_line(color = 'blue') + 
  geom_hline(yintercept = mean(Chicago_cleaned$price), color="red")
print(Chicago_graph)

Chicago_point_graph <- Chicago_cleaned %>%
  filter(date >= "2022-04-28") %>%
  filter(date <= "2022-06-29") %>%
  summarise(mean_price = mean(price)) %>%
  ggplot(aes(x= date, y= mean_price)) +
  geom_point()
print(Chicago_point_graph)

Chicago_cleaned %>% filter(price < 9999) %>% 
  filter(date >= "2022-04-28") %>%
  filter(date <= "2022-06-29") %>%
  ggplot(Chicago_cleaned, mapping = aes(date, price)) + geom_point(aes(color = distance))

fwrite(Dallas_graph, file = "../../gen/Dallas_graph")
fwrite(Mexico_graph, file = "../../gen/Mexico_graph")
fwirte(Chicago_graph, file = "../../gen/Chicago_graph" )
