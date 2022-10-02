#install packages 
library(dplyr)
library(readr)
library(data.table)

# Load datasets
Dallas_listings <- read_csv('../../data/Dallas/Dallas_listings.csv')
Dallas_reviews <- read_csv('../../data/Dallas/Dallas_reviews.csv')

Chicago_listings <- read_csv('../../data/Chicago/Chicago_listings.csv')
Chicago_reviews <- read_csv('../../data/Chicago/Chicago_reviews.csv')

Mexico_listings <- read_csv('../../data//Mexico/Mexico_listings.csv')
Mexico_reviews <- read_csv('../../data/Mexico/Mexico_reviews.csv')


#rename columns to 'Identifier' and join Dallas
Dallas_reviews <- Dallas_reviews %>% 
  rename('Identifier' = listing_id)
Dallas_listings <- Dallas_listings %>%
  rename('Identifier' = id)

Dallas_merged <- left_join(Dallas_listings, Dallas_reviews, by = 'Identifier') #have to check which join we want

#rename columns to 'Identifier' and join Chicago 
Chicago_reviews <- Chicago_reviews %>%
  rename('Identifier' = listing_id)
Chicago_listings <- Chicago_listings %>%
  rename('Identifier' = id)

Chicago_merged <- left_join(Chicago_listings, Chicago_reviews, by = 'Identifier')

#rename columns to 'Identifier' and join Mexico
Mexico_reviews <- Mexico_reviews %>%
  rename('Identifier' = listing_id)
Mexico_listings <- Mexico_listings %>%
  rename('Identifier' = id)

Mexico_merged <- left_join(Mexico_listings, Mexico_reviews, by = 'Identifier')

fwrite(Mexico_merged, file = "../../data/Mexico/Mexico.csv", sep = ",", quote = TRUE)
fwrite(Dallas_merged, file = "../../data/Dallas/Dallas.csv", sep = ",", quote = TRUE)
fwrite(Chicago_merged, file = "../../data/Chicago/Chicago.csv", sep = ",", quote = TRUE)
