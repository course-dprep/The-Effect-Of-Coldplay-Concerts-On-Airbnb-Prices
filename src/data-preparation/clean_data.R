library(tidyr)
library(readr)
library(dplyr)
library(data.table)

#import data 
Mexico <- read_csv("../../data/Mexico/Mexico_merged.csv")
Dallas <- read_csv("../../data/Dallas/Dallas_merged.csv")
Chicago <- read_csv("../../data/Chicago/Chicago_merged.csv")


#subset, filter for outlying prices and create dummy for dates during the concert for Mexico
Mexico_cleaned <- Mexico %>% 
  select(Identifier, host_is_superhost, latitude, longitude, room_type, accommodates, price, date) %>%
  na.omit() %>%
  filter(price < 9999)

Mexico_cleaned$DuringConcert <- ifelse(Mexico$date == as.Date("2022-05-28") | Mexico$date == as.Date("2022-05-29"), 1, 0) 


#subset, filter for outlying prices and create dummy for dates during the concert for Dallas
Dallas_cleaned <- Dallas %>%
  select(Identifier, host_is_superhost, latitude, longitude, room_type, accommodates, price, date) %>%
  na.omit() %>%
  filter(price < 9999)
  
Dallas_cleaned$DuringConcert <- ifelse(Dallas$date == as.Date("2022-05-06"), 1, 0) 



#subset, filter for outlying prices and create dummy for dates during the concert for Chicago 
Chicago_cleaned <- Chicago %>%
  select(Identifier, host_is_superhost, latitude, longitude, room_type, accommodates, price, date) %>%
  na.omit() %>%
  filter(price < 9999)

Chicago_cleaned$DuringConcert <- ifelse(Chicago$date == as.Date("2022-05-28") | Chicago$date == as.Date("2022-05-29"), 1, 0) 


#clean price column Dallas (not pretty but it works)
Dallas_cleaned$price <- gsub('[$]', '', Dallas_cleaned$price)
Dallas_cleaned$price <- gsub('[,]', '', Dallas_cleaned$price)
Dallas_cleaned$price <- gsub('[.]', '', Dallas_cleaned$price)
Dallas_cleaned$price <- as.numeric(Dallas_cleaned$price)
Dallas_cleaned$price <- Dallas_cleaned$price / 100

#clean price column Chicago (not pretty but it works)
Chicago_cleaned$price <- gsub('[$]', '', Chicago_cleaned$price)
Chicago_cleaned$price <- gsub('[,]', '', Chicago_cleaned$price)
Chicago_cleaned$price <- gsub('[.]', '', Chicago_cleaned$price)
Chicago_cleaned$price <- as.numeric(Chicago_cleaned$price)
Chicago_cleaned$price <- Chicago_cleaned$price / 100

#clean price column Mexico (not pretty but it works)
Mexico_cleaned$price <- gsub('[$]', '', Mexico_cleaned$price)
Mexico_cleaned$price <- gsub('[,]', '', Mexico_cleaned$price)
Mexico_cleaned$price <- gsub('[.]', '', Mexico_cleaned$price)
Mexico_cleaned$price <- as.numeric(Mexico_cleaned$price)
Mexico_cleaned$price <- Mexico_cleaned$price / 100 

#create dummy variable for is host_superhost 
Mexico_cleaned$host_is_superhost <- as.numeric(Mexico_cleaned$host_is_superhost)
Dallas_cleaned$host_is_superhost <- as.numeric(Dallas_cleaned$host_is_superhost)
Chicago_cleaned$host_is_superhost <- as.numeric(Chicago_cleaned$host_is_superhost)


#output
fwrite(Mexico, file = "../../data/Mexico/Mexico_cleaned.csv", sep = ",", quote = TRUE)
fwrite(Dallas, file = "../../data/Dallas/Dallas_cleaned.csv", sep = ",", quote = TRUE)
fwrite(Chicago, file = "../../data/Chicago/Chicago_cleaned.csv", sep = ",", quote = TRUE)


