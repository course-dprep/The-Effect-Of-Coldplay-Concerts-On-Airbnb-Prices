#install packages 
install.packages('dplyr')
library(dplyr)
library(readr)

# Load datasets
Dallas_listings <- read_csv('data/Dallas_listings.csv.gz')
Dallas_reviews <- read_csv('data/Dallas_reviews.csv.gz')

Chicago_listings <- read_csv('data/Chicago_listings.csv.gz')
Chicago_reviews <- read_csv('data/Chicago_reviews.csv.gz')

Mexico_listings <- read_csv('data/Mexico_listings.csv.gz')
Mexico_reviews <- read_csv('data/Mexico_reviews.csv.gz')


#rename columns to 'Identifier' and join Dallas
Dallas_reviews <- Dallas_reviews %>% 
  rename('Identifier' = listing_id)
Dallas_listings <- Dallas_listings %>%
  rename('Identifier' = id)

Dallas <- left_join(Dallas_listings, Dallas_reviews, by = 'Identifier') #have to check which join we want

#rename columns to 'Identifier' and join Chicago 
Chicago_reviews <- Chicago_reviews %>%
  rename('Identifier' = listing_id)
Chicago_listings <- Chicago_listings %>%
  rename('Identifier' = id)

Chicago <- left_join(Chicago_listings, Chicago_reviews, by = 'Identifier')

#rename columns to 'Identifier' and join Mexico
Mexico_reviews <- Mexico_reviews %>%
  rename('Identifier' = listing_id)
Mexico_listings <- Mexico_listings %>%
  rename('Identifier' = id)

Mexico <- left_join(Mexico_listings, Mexico_reviews, by = 'Identifier')


