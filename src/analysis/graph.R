#code for measuring distance 

Mexico_cleaned <- read_csv("../../data//Mexico/Mexico_cleaned.csv")
Dallas_cleaned <- read_csv("../../data/Dallas/Dallas_cleaned.csv")
Chicago_cleaned <- read_csv("../../data/Chicago/Chicago_cleaned.csv")

#create graph with mean price for Dallas
Dallas_graph <- Dallas_cleaned %>% filter(distance <= 50) %>% 
  filter(date >= "2022-05-01") %>%
  filter(date <= "2022-05-10") %>%
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

class(Mexico_cleaned$distance)
#create graph with mean price for Mexico
Mexico_graph <- Mexico_cleaned %>% filter(distance <= 50) %>% 
  filter(date >= "2022-04-01") %>%
  filter(date <= "2022-04-10") %>%
  group_by(date) %>%
  summarize(mean_price = mean(price)) %>%
  ggplot(aes(x = date, y = mean_price)) + 
  geom_line(color = 'blue') + 
  geom_hline(yintercept = mean(Mexico_cleaned$price), color="red")
print(Mexico_graph)

fwrite(Dallas_graph, file = "../../gen/Dallas_graph")
fwrite(Mexico_graph, file = "../../gen/Mexico_graph")
fwirte(Chicago_graph, file = "../../gen/Chicago_graph" )
