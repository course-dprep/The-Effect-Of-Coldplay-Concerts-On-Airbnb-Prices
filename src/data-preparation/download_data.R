library(readr)

#create data repository 
dir.create('../../data')
dir.create('../../data/Dallas')  
dir.create('../../data/Chicago')
dir.create('../../data/Mexico')


#download and load data 
#Dallas
download.file(url = 'http://data.insideairbnb.com/united-states/tx/dallas/2022-09-14/data/listings.csv',
              destfile = '../../data/Dallas/Dallas_listings.csv')
download.file(url = 'http://data.insideairbnb.com/united-states/tx/dallas/2022-09-14/data/reviews.csv',
              destfile = '../../data/Dallas/Dallas_reviews.csv')

#Chicago
download.file(url = 'http://data.insideairbnb.com/united-states/il/chicago/2022-09-14/data/listings.csv',
              destfile = '../../data/Chicago/Chicago_listings.csv')
download.file(url = 'http://data.insideairbnb.com/united-states/il/chicago/2022-09-14/data/reviews.csv',
              destfile = '../../data/Chicago/Chicago_reviews.csv')


#Mexico City
download.file(url = 'http://data.insideairbnb.com/mexico/df/mexico-city/2022-06-21/data/listings.csv',
              destfile = '../../data/Mexico/Mexico_listings.csv')
download.file(url = 'http://data.insideairbnb.com/mexico/df/mexico-city/2022-06-21/data/reviews.csv',
              destfile = '../../data/Mexico/Mexico_reviews.csv')

