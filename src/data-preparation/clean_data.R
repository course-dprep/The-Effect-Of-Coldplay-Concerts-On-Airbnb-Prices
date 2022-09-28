###own data####
#subset 
Mexico <- subset(Mexico_listings, select = -c (host_name, reviews_per_month, calculated_host_listings_count, license, neighbourhood_group, minimum_nights, number_of_reviews_ltm))
MexicoDuringConcert <- subset(Mexico$last_review, select = ("03-04-2022":"07-04-2022"))

#filter dates during concert  
MexicoDuringConcert <- Mexico %>%
  filter(between(last_review, as.Date('2022-04-03'), as.Date('2022-04-07'))) %>%
  arrange(last_review) 

#filter Dallas 
Dallas <- subset(Dallas_Listings, select = -c (host_name, reviews_per_month, calculated_host_listings_count, license, neighbourhood_group, minimum_nights, number_of_reviews_ltm))
MexicoDuringConcert <- subset(Mexico$last_review, select = ("06-04-2022":"06-04-2022"))

#filter dates during concert  
DallasDuringConcert <- Dallas %>%
  filter(between(last_review, as.Date('2022-04-06'), as.Date('2022-04-06'))) %>%
  arrange(last_review) 

#clean price column 
Dallas$price <- gsub('[$]', '', Dallas$price)
Dallas$price <- gsub('[,]', '', Dallas$price)
Dallas$price <- gsub('[.]', '', Dallas$price)
Dallas$price <- as.numeric(Dallas$price)
Dallas$price <- Dallas$price / 100


