#code for measuring distance 

Mexico_cleaned_for_dist <- read_csv("../../data//Mexico/Mexico_cleaned_for_dist.csv")
Dallas_cleaned_for_dist <- read_csv("../../data/Dallas/Dallas_cleaned_for_dist.csv")
Chicago_cleaned_for_dist <- read_csv("../../data/Chicago/Chicago_cleaned_for_dist.csv")

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

#coordinates of Cotton Bowl stadium (Dalles) are -96.452099, 32.462819

Dallas_cleaned_for_dist$distance <- earth.dist(Dallas_cleaned_for_dist$longitude, Dallas_cleaned$latitude, -96.452099, 32.462819)

#coordinates of Foro Sol (Mexico City) are -99.052724, 19.241055 

Mexico_cleaned_for_dist$distance <- earth.dist(Mexico_cleaned_for_dist$longitude, Mexico_cleaned$latitude, -99.052724, 19.241055)

#coordinates of Soldier Field (Chicago) are -87.617256, 41.862366

Chicago_cleaned_for_dist$distance <- earth.dist(Chicago_cleaned_for_dist$longitude, Chicago_cleaned$latitude, -87.617256, 41.862366)



