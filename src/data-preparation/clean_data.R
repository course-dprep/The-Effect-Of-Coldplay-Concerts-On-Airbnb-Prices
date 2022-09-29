#read.csv("")


#subset 
Mexico <- Mexico %>% 
  select(Identifier, host_is_superhost, latitude, longitude, room_type, accommodates, price, date)

#filter dates during concert  
MexicoDuringConcert <- Mexico %>%
filter(between(date, as.Date('2022-04-03'), as.Date('2022-04-07'))) %>%
  arrange(date) 

#filter Dallas 
Dallas <- Dallas %>%
  select(Identifier, host_is_superhost, latitude, longitude, room_type, accommodates, price, date) 

#filter dates during concert  
DallasDuringConcert <- Dallas %>%
  filter(between(date, as.Date('2022-04-06'), as.Date('2022-04-06'))) %>%
  arrange(date)

#Filter Chicago 
Chicago <- Chicago %>%
  select(Identifier, host_is_superhost, latitude, longitude, room_type, accommodates, price, date)

ChicagoDuringConcert <- Chicago %>%
  filter(between(date, as.Date('2022-05-28'), as.Date('2022-05-29'))) %>%
  arrange(date) 

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

#create dummy variable for is host superhost 
DallasDuringConcert$host_is_superhost <- transform(as.numeric(DallasDuringConcert$host_is_superhost))
MexicoDuringConcert$host_is_superhost <- transform(as.numeric(MexicoDuringConcert$host_is_superhost))
ChicagoDuringConcert$host_is_superhost <- transform(as.numeric(ChicagoDuringConcert$host_is_superhost))
