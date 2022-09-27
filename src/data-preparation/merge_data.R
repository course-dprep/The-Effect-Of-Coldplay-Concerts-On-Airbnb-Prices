# Load datasets into R 
Dallas_listings <- read_csv('data/Dallas_listings.csv.gz')
Dallas_reviews <- read_csv('data/Dallas_reviews.csv.gz')

install.packages('dplyr')
library(dplyr)


#join datasets
Dallas_reviews <- Dallas_reviews %>%
  rename('id' = listing_id)

Dallas <- left_join(Dallas_listings, Dallas_reviews, by = 'id')

# Load datasets into R
Chicago_listings <- read_csv('data/Chicago_listings.csv.gz')
Chicago_reviews <- read_csv('data/Chicago_reviews.csv.gz')

#join datasets
Chicago_reviews <- Chicago_reviews %>%
  rename('id' = listing_id)

Chicago <- left_join(Chicago_listings, Chicago_reviews, by = 'id')
View(Chicago)

# Load datasets into R 
Mexico_listings <- read_csv('data/Mexico_listings.csv.gz')
Mexico_reviews <- read_csv('data/Mexico_reviews.csv.gz')

#join datasets
Mexico_reviews <- Mexico_reviews %>%
  rename('id' = listing_id)

Mexico <- left_join(Mexico_listings, Mexico_reviews, by = 'id')

head(Mexico)
