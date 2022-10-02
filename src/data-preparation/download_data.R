library(readr)

#create data repository 
dir.create('./data')  


#download and load data 
#Dallas
download.file(url = 'http://data.insideairbnb.com/united-states/tx/dallas/2022-09-14/data/listings.csv.gz',
              destfile = './data/Dallas_listings.csv.gz')
download.file(url = 'http://data.insideairbnb.com/united-states/tx/dallas/2022-09-14/data/reviews.csv.gz',
              destfile = './data/Dallas_reviews.csv.gz')

#Chicago
download.file(url = 'http://data.insideairbnb.com/united-states/il/chicago/2022-09-14/data/listings.csv.gz',
              destfile = './data/Chicago_listings.csv.gz')

download.file(url = 'http://data.insideairbnb.com/united-states/il/chicago/2022-09-14/data/reviews.csv.gz',
              destfile = './data/Chicago_reviews.csv.gz')


#Mexico City
download.file(url = 'http://data.insideairbnb.com/mexico/df/mexico-city/2022-06-21/data/listings.csv.gz',
              destfile = './data/Mexico_listings.csv.gz')
download.file(url = 'http://data.insideairbnb.com/mexico/df/mexico-city/2022-06-21/data/reviews.csv.gz',
              destfile = './data/Mexico_reviews.csv.gz')

