library(tidyr)
library(readr)
library(dplyr)
library(data.table)

#import data 
Mexico <- read_csv("../../data/Mexico/Mexico_merged.csv")
Dallas <- read_csv("../../data/Dallas/Dallas_merged.csv")
Chicago <- read_csv("../../data/Chicago/Chicago_merged.csv")


#subset and create dummy for dates during the concert
Mexico <- Mexico %>% 
  select(Identifier, host_is_superhost, latitude, longitude, room_type, accommodates, price, date) %>%
  na.omit()

Mexico$DuringConcert <- ifelse(Mexico$date == as.Date("2022-05-28") | Mexico$date == as.Date("2022-05-29"), 1, 0) 


#filter Dallas and create dummy for dates during the concert
Dallas <- Dallas %>%
  select(Identifier, host_is_superhost, latitude, longitude, room_type, accommodates, price, date) 

Dallas$DuringConcert <- ifelse(Dallas$date == as.Date("2022-05-06"), 1, 0) 


#Filter Chicago and create dummy for dates during the concert
Chicago <- Chicago %>%
  select(Identifier, host_is_superhost, latitude, longitude, room_type, accommodates, price, date)

Chicago$DuringConcert <- ifelse(Chicago$date == as.Date("2022-05-28") | Chicago$date == as.Date("2022-05-29"), 1, 0) 


#clean price column Dallas (not pretty but it works)
Dallas$price <- gsub('[$]', '', Dallas$price)
Dallas$price <- gsub('[,]', '', Dallas$price)
Dallas$price <- gsub('[.]', '', Dallas$price)
Dallas$price <- as.numeric(Dallas$price)
Dallas$price <- Dallas$price / 100

#clean price column Chicago (not pretty but it works)
Chicago$price <- gsub('[$]', '', Chicago$price)
Chicago$price <- gsub('[,]', '', Chicago$price)
Chicago$price <- gsub('[.]', '', Chicago$price)
Chicago$price <- as.numeric(Chicago$price)
Chicago$price <- Chicago$price / 100

#clean price column Mexico (not pretty but it works)
Mexico$price <- gsub('[$]', '', Mexico$price)
Mexico$price <- gsub('[,]', '', Mexico$price)
Mexico$price <- gsub('[.]', '', Mexico$price)
Mexico$price <- as.numeric(Mexico$price)
Mexico$price <- Mexico$price / 100 

#create dummy variable for is host_superhost 
Mexico$host_is_superhost <- as.numeric(Mexico$host_is_superhost)
Dallas$host_is_superhost <- as.numeric(Dallas$host_is_superhost)
Chicago$host_is_superhost <- as.numeric(Chicago$host_is_superhost)

#output
fwrite(Mexico, file = "../../data/Mexico/Mexico_cleaned.csv", sep = ",", quote = TRUE)
fwrite(Dallas, file = "../../data/Dallas/Dallas_cleaned.csv", sep = ",", quote = TRUE)
fwrite(Chicago, file = "../../data/Chicago/Chicago_cleaned.csv", sep = ",", quote = TRUE)


