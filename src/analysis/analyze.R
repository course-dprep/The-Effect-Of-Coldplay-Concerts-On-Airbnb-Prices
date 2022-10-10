library(fixest)
library(broom)
library(tidyr)
library(ggplot2)
library(readr)

#create directories for graphs and regressions 
dir.create('../../gen/Dallas')
dir.create('../../gen/Mexico')
dir.create('../../gen/Chicago')

#import data 
Mexico_cleaned <- read_csv("../../data/Mexico/Mexico_cleaned.csv")
Dallas_cleaned <- read_csv("../../data/Dallas/Dallas_cleaned.csv")
Chicago_cleaned <- read_csv("../../data/Chicago/Chicago_cleaned.csv")

#run regressions research question 1 -> checking if this is necessary in our study
Dallas_reg_1 <-   feols(price ~ AfterConcert 
                  + BeforeConcert,
                  data = Dallas_cleaned)
tidy(Dallas_reg_1, conf.int = TRUE)

Chicago_reg_2 <-   feols(price ~ AfterConcert 
                       + BeforeConcert, 
                      data = Chicago_cleaned)
tidy(Chicago_reg_2, conf.int = TRUE)

Mexico_reg_2 <- feols(price ~ AfterConcert 
                      + BeforeConcert, 
                      data = Mexico_cleaned)
tidy(Mexico_reg_2, conf.int = TRUE)

#run regression interactions distance and type of room

Dallas_reg_2 <- feols(price ~ DuringConcert + distance + room_type +
                        DuringConcert*distance + DuringConcert*room_type,
                      data = Dallas_cleaned)
tidy(Dallas_reg_2, conf.int = TRUE)

Chicago_reg_2 <- feols(price ~ DuringConcert + distance + room_type +
                         DuringConcert*distance + DuringConcert*room_type,
                       data = Chicago_cleaned)
tidy(Chicago_reg_2, conf.int = TRUE)

Mexico_reg_2 <- feols(price ~ DuringConcert + distance + room_type +
                        DuringConcert*distance + DuringConcert*room_type,
                      data = Mexico_cleaned)
tidy(Mexico_reg_2, conf.int = TRUE)

#save regressions 
fwrite(Dallas_reg, file = "../../gen/Dallas_reg")
fwrite(Mexico_reg, file = "../../gen/Mexico_reg")
fwrite(Chicago_reg, file = "../../gen/Chicago_reg")




