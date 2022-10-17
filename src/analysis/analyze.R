library(fixest)
library(broom)
library(tidyr)
library(ggplot2)
library(readr)
library(data.table)
library(stargazer)


dir.create('../../gen/output/regression')

#import data 
Mexico_cleaned <- read_csv("../../data/Mexico/Mexico_cleaned.csv")
Dallas_cleaned <- read_csv("../../data/Dallas/Dallas_cleaned.csv")
Chicago_cleaned <- read_csv("../../data/Chicago/Chicago_cleaned.csv")

#run regressions 
Dallas_reg <-   lm(price ~ DuringConcert +
                          distance + room_type +
                          accommodates, 
                        data = Dallas_cleaned)

Chicago_reg <-   lm(price ~ DuringConcert +
                         distance + room_type +
                         accommodates, 
                       data = Chicago_cleaned)

Mexico_reg <-   lm(price ~ DuringConcert+
                        distance + room_type +
                        accommodates, 
                      data = Mexico_cleaned)


stargazer(Mexico_reg, Dallas_reg, Chicago_reg, 
          type="html",
          title="Effect of date, distance, and room type ",
          dep.var.caption = 'Price in dollars',
          dep.var.labels= '',
          column.labels = c('Mexico', 'Dallas', "Chicago"),
          covariate.labels = c('During concert', 'Distance', 'Private room', 'Shared room', 'accommodates'),
          notes.label = 'Significance levels',
          out='../../gen/output/regression/regression_table.txt')

