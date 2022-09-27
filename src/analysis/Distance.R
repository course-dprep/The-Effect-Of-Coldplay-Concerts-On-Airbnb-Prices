#code for measuring distance 

earth.dist <- function (long1, lat1, long2, lat2)
{
  rad <- pi/180
  a1 <- lat1 * rad
  a2 <- long1 * rad
  b1 <- lat2 * rad
  b2 <- long2 * rad
  dlon <- b2 - a2
  dlat <- b1 - a1
  a <- (sin(dlat/2))^2 + cos(a1) * cos(b1) * (sin(dlon/2))^2
  c <- 2 * atan2(sqrt(a), sqrt(1 - a))
  R <- 6378.145
  d <- R * c
  return(d)
}

#Dallas 

longconcertDal <- -96.75583031

latconcertDal <- 32.774496902

concert.dist <- function (Dallas_listings$longitude, Dallas_listings$latitude, longconcertDal, latconcertDal)
  {
   rad <- pi/180
  a1 <- Dallas_listings$latitude * rad
  a2 <- Dallas_listings$longitude * rad
  b1 <- latconcertDal * rad
  b2 <- longconcertDal * rad
  dlon <- b2 - a2
  dlat <- b1 - a1
  a <- (sin(dlat/2))^2 + cos(a1) * cos(b1) * (sin(dlon/2))^2
  c <- 2 * atan2(sqrt(a), sqrt(1 - a))
  R <- 6378.145
  d <- R * c
  return(d)
}

Dallas_listings %>%
  mutate(concert.dist)


