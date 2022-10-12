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

Dallas_reg <-   lm(price ~ DuringConcert +
                          distance + room_type +
                          accommodates, 
                        data = Dallas_cleaned)
summary(Dallas_reg)

Chicago_reg <-   lm(price ~ DuringConcert +
                         distance + room_type +
                         accommodates, 
                       data = Chicago_cleaned)
summary(Chicago_reg)

Mexico_reg <-   lm(price ~ DuringConcert+
                        distance + room_type +
                        accommodates, 
                      data = Mexico_cleaned)
summary(Mexico_reg)

# overview of the coefficient names

names(Dallas_reg$coefficients)
names(Chicago_reg$coefficients)
names(Mexico_reg$coefficients)

stargazer(Mexico_reg, Dallas_reg, Chicago_reg, 
          type="html",
          title="Effect of date, distance, and room type ",
          dep.var.caption = 'Price in dollars',
          dep.var.labels= '',
          column.labels = c('Mexico', 'Dallas', "Chicago"),
          covariate.labels = c('During concert', 'Distance', 'Private room', 'Shared room', 'accommodates'),
          notes.label = 'Significance levels',
          out='../../gen/analysis/output/regression_table.txt')

