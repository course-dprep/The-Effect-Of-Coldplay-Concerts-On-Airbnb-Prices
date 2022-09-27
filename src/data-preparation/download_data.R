library(readr)

#create data repository 
#dir.create('./data')  


#download and load data 
#Dallas
download.file(url = 'http://data.insideairbnb.com/united-states/tx/dallas/2022-09-14/data/listings.csv.gz',
              destfile = './data/Dallas_listings.csv')
download.file(url = 'http://data.insideairbnb.com/united-states/tx/dallas/2022-09-14/data/reviews.csv.gz',
              destfile = './data/Dallas_reviews.csv')

Dallas_listings <- read_csv('data/Dallas_listings.csv')
Dallas_reviews <- read_csv('data/Dallas_reviews.csv')

#Chicago
download.file(url = 'http://data.insideairbnb.com/united-states/il/chicago/2022-09-14/data/listings.csv.gz',
              destfile = './data/Chicago_listings.csv')

download.file(url = 'http://data.insideairbnb.com/united-states/il/chicago/2022-09-14/data/reviews.csv.gz',
              destfile = '.data/Chicago_reviews.csv')

Chicago_listings <- read_csv('data/Chicago_listings.csv')
Chicago_reviews <- read_csv('data/Chicago_reviews.csv')

#Mexico City
download.file(url = 'http://data.insideairbnb.com/mexico/df/mexico-city/2022-06-21/data/listings.csv.gz',
              destfile = './data/Mexico_listings.csv')
download.file(url = 'http://data.insideairbnb.com/mexico/df/mexico-city/2022-06-21/data/reviews.csv.gz',
              destfile = './data/Mexico_reviews.csv')

Mexico_listings <- read_csv('data/Mexico_listings.csv')
Mexico_reviews <- read_csv('data/Mexico_reviews.csv')
