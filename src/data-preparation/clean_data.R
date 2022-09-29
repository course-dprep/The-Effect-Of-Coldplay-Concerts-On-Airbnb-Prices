library(tidyr)
library(readr)
library(dplyr)

#subset and create dummy for dates during the concert
Mexico <- Mexico %>% 
  select(Identifier, host_is_superhost, latitude, longitude, room_type, accommodates, price, date)

Mexico$DuringConcert <- ifelse(Mexico$date == as.Date("2022-05-28") | Mexico$date == as.Date("2022-05-29"), 1, 0) 


#filter Dallas and create dummy for dates during the concert
Dallas <- Dallas %>%
  select(Identifier, host_is_superhost, latitude, longitude, room_type, accommodates, price, date) 

Dallas$DuringConcert <- ifelse(Dallas$date == as.Date("2022-05-06"), 1, 0) 


#Filter Chicago and create dummy for dates during the concert
Chicago <- Chicago %>%
  select(Identifierßuperhost, latitude, longitude, room_type, accommodates, price, date)

Chicago$DuringConcert <- ifelse(Chicago$date == as.Date("2022-05-28") | Chicago$date == as.Date("2022-05-29"), 1, 0) 


#clean price column Dallas (not pretty but it works)
DallasDuringConcert$price <- gsub('[$]', '', DallasDuringConcert$price)
DallasDuringConcert$price <- gsub('[,]', '', DallasDuringConcert$price)
DallasDuringConcert$price <- gsub('[.]', '', DallasDuringConcert$price)
DallasDuringConcert$price <- as.numeric(DallasDuringConcert$price)
DallasDuringConcert$price <- DallasDuringConcert$price / 100

#clean price column Chicago (not pretty but it works)
ChicagoDuringConcert$price <- gsub('[$]', '', ChicagoDuringConcert$price)
ChicagoDuringConcert$price <- gsub('[,]', '', ChicagoDuringConcert$price)
ChicagoDuringConcert$price <- gsub('[.]', '', ChicagoDuringConcert$price)
ChicagoDuringConcert$price <- as.numeric(ChicagoDuringConcert$price)
ChicagoDuringConcert$price <- ChicagoDuringConcert$price / 100

#clean price column Mexico (not pretty but it works)
MexicoDuringConcert$price <- gsub('[$]', '', MexicoDuringConcert$price)
MexicoDuringConcert$price <- gsub('[,]', '', MexicoDuringConcert$price)
MexicoDuringConcert$price <- gsub('[.]', '', MexicoDuringConcert$price)
MexicoDuringConcert$price <- as.numeric(MexicoDuringConcert$price)
MexicoDuringConcert$price <- MexicoDuringConcert$price / 100

#create dummy variable for is host_superhost 
DallasDuringConcert$host_is_superhost <- transform(as.numeric(DallasDuringConcert$host_is_superhost))
MexicoDuringConcert$host_is_superhost <- transform(as.numeric(MexicoDuringConcert$host_is_superhost))
ChicagoDuringConcert$host_is_superhost <- transform(as.numeric(ChicagoDuringConcert$host_is_superhost))


