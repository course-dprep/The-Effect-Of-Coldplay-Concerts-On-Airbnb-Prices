#code for measuring distance 

Mexico_cleaned_for_dist <- read_csv("../../data//Mexico/Mexico_cleaned_for_dist.csv")
Dallas_cleaned_for_dist <- read_csv("../../data/Dallas/Dallas_cleaned_for_dist.csv")
Chicago_cleaned_for_dist <- read_csv("../../data/Chicago/Chicago_cleaned_for_dist.csv")

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
