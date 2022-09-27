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
Mexico_listings <- read_csv('data/Mexico_listings.csv.gz')
Mexico_reviews <- read_csv('data/Mexico_reviews.csv.gz')

install.packages('dplyr')
library(dplyr)


#join datasets
Mexico_reviews <- Mexico_reviews %>%
  rename('id' = listing_id)

Mexico <- left_join(Mexico_listings, Mexico_reviews, by = 'id')

head(Mexico)
