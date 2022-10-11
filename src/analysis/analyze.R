library(fixest)
library(broom)
library(tidyr)
library(ggplot2)
library(readr)
library(data.table)
library(stargazer)

#create directories for graphs and regressions 
dir.create('../../gen/Dallas')
dir.create('../../gen/Mexico')
dir.create('../../gen/Chicago')

#import data 
load("../../data/Mexico/Mexico_cleaned.csv")
load("../../data/Dallas/Dallas_cleaned.csv")
load("../../data/Chicago/Chicago_cleaned.csv")

#run regressions 
Dallas_reg <-   feols(price ~ distance + 
                        accommodates + DuringConcert, 
                      data = Dallas_cleaned)

Chicago_reg <-   feols(price ~ distance + 
                         accommodates + DuringConcert, 
                       data = Chicago_cleaned)

Dallas_reg <-   feols(price ~ DuringConcert +
                          distance + room_type +
                          accommodates, 
                        data = Dallas_cleaned)

Chicago_reg <-   feols(price ~ DuringConcert +
                         distance + room_type +
                         accommodates, 
                       data = Chicago_cleaned)

Mexico_reg <-   feols(price ~ DuringConcert+
                        distance + room_type +
                        accommodates, 
                      data = Mexico_cleaned)

stargazer(Mexico_reg, Dallas_reg, Chicago_reg, title="Effect of distance, date and room type ",
          dep.var.caption = 'Price in dollars',
          dep.var.labels= '',
          column.labels = c('Mexico', 'Dallas', "Chicago"),
          covariate.labels = c('distance', 'accommodates', 'Rented during concert',
          ),
          notes.label = 'Significance levels',
          type = 'html', 
          out='../../gen/analysis/output/regression_table')

