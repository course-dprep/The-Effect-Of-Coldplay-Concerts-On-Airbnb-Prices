library(tidyr)
library(readr)
library(dplyr)
library(data.table)


#import data 
Mexico_merged <- read_csv("../../data/Mexico/Mexico_merged.csv")
Dallas_merged <- read_csv("../../data/Dallas/Dallas_merged.csv")
Chicago_merged <- read_csv("../../data/Chicago/Chicago_merged.csv")


#subset, filter for dates one month before and after the concert for Mexico and filter out price outliers and filter out 'Hotel rooms' to get same type of rooms as other cities.
Mexico_cleaned <- Mexico_merged %>% 
  select(Identifier, latitude, longitude, room_type, accommodates, price, date) %>%
  filter(Mexico_merged$date > "2022-03-03" & Mexico_merged$date < "2022-05-07") %>%
  filter(price < 9999) %>%
  filter(room_type != 'Hotel room')
  

#subset, filter for dates one month before and after the concert for Dallas and filter out price outliers..
Dallas_cleaned <- Dallas_merged %>%
  select(Identifier, latitude, longitude, room_type, accommodates, price, date) %>%
  filter(Dallas_merged$date > "2022-04-06" & Dallas_merged$date < "2022-06-06") %>%
  filter(price < 9999)

#subset, filter for dates one month before and after the concert for Chicago and filter out price outliers and filter out 'Hotel rooms' to get same type of rooms as other cities.
Chicago_cleaned <- Chicago_merged %>%
  select(Identifier, latitude, longitude, room_type, accommodates, price, date) %>%
  filter(Chicago_merged$date > "2022-04-28" & Chicago_merged$date < "2022-06-29") %>%
  filter(price < 9999) %>%
  filter(room_type != 'Hotel room')

#calculate distance column 
earth.dist <- function (long1, lat1, long2, lat2)
{
  rad <- pi/180
  a1 <- lat1 * rad
  a2 <- long1 * rad
  b1 <- lat2 * rad
  b2 <- long2 * rad
  dlon <- b2 - a2
  dlat <- b1 - a1
  a <- (sin(dlat/2))^2 + cos(a1) * cos(b1) * (sin(dlon/2))^2
  c <- 2 * atan2(sqrt(a), sqrt(1 - a))
  R <- 6378.145
  d <- R * c
  return(d)
}

# create variables for dates during the concert and distance

# Mexico (coordinates of Foro Sol are -99.052724, 19.241055)
Mexico_cleaned$DuringConcert <- Mexico_cleaned$date == as.Date("2022-04-03") | Mexico_cleaned$date == as.Date("2022-04-04") | Mexico_cleaned$date == as.Date("2022-04-06")| Mexico_cleaned$date == as.Date("2022-04-07") 
Mexico_cleaned$distance <- earth.dist(Mexico_cleaned$longitude, Mexico_cleaned$latitude, -99.052724, 19.241055)

# Dallas (coordinates of Cotton Bowl stadium are -96.452099, 32.462819)
Dallas_cleaned$DuringConcert <- Dallas_cleaned$date == as.Date("2022-05-06")
Dallas_cleaned$distance <- earth.dist(Dallas_cleaned$longitude, Dallas_cleaned$latitude, -96.452099, 32.462819)

# Chicago (coordinates of Soldier Field are -87.617256, 41.862366)
Chicago_cleaned$DuringConcert <- Chicago_cleaned$date == as.Date("2022-05-28") | Chicago_cleaned$date == as.Date("2022-05-29")
Chicago_cleaned$distance <- earth.dist(Chicago_cleaned$longitude, Chicago_cleaned$latitude, -87.617256, 41.862366)

#clean price column Dallas
Dallas_cleaned$price <- gsub('[$]', '', Dallas_cleaned$price)
Dallas_cleaned$price <- gsub('[,]', '', Dallas_cleaned$price)
Dallas_cleaned$price <- gsub('[.]', '', Dallas_cleaned$price)
Dallas_cleaned$price <- as.numeric(Dallas_cleaned$price)
Dallas_cleaned$price <- Dallas_cleaned$price / 100


#clean price column Chicago 
Chicago_cleaned$price <- gsub('[$]', '', Chicago_cleaned$price)
Chicago_cleaned$price <- gsub('[,]', '', Chicago_cleaned$price)
Chicago_cleaned$price <- gsub('[.]', '', Chicago_cleaned$price)
Chicago_cleaned$price <- as.numeric(Chicago_cleaned$price)
Chicago_cleaned$price <- Chicago_cleaned$price / 100

#clean price column Mexico 
Mexico_cleaned$price <- gsub('[$]', '', Mexico_cleaned$price)
Mexico_cleaned$price <- gsub('[,]', '', Mexico_cleaned$price)
Mexico_cleaned$price <- gsub('[.]', '', Mexico_cleaned$price)
Mexico_cleaned$price <- as.numeric(Mexico_cleaned$price)
Mexico_cleaned$price <- Mexico_cleaned$price / 100

#write output
fwrite(Mexico_cleaned, file = "../../data/Mexico/Mexico_cleaned.csv", sep = ",", quote = TRUE )
fwrite(Dallas_cleaned, file = "../../data/Dallas/Dallas_cleaned.csv", sep = ",", quote = TRUE)
fwrite(Chicago_cleaned, file = "../../data/Chicago/Chicago_cleaned.csv", sep = ",", quote = TRUE)