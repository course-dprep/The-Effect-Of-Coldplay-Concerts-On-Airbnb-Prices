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

#coordinates of Cotton Bowl stadium (Dalles) are -96.452099, 32.462819

DallasDuringConcert$distance <- earth.dist(DallasDuringConcert$longitude, DallasDuringConcert$latitude, -96.452099, 32.462819)

#coordinates of Foro Sol (Mexico City) are -99.052724, 19.241055 

MexicoDuringConcert$distance <- earth.dist(MexicoDuringConcert$longitude, MexicoDuringConcert$latitude, -99.052724, 19.241055)

#coordinates of Soldier Field (Chicago) are -87.617256, 41.862366

ChicagoDuringConcert$distance <- earth.dist(ChicagoDuringConcert$longitude, ChicagoDuringConcert$latitude, -87.617256, 41.862366)

