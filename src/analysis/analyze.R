#shape of the regression 
install.packages('fixest')
library('fixest')

reg1 <- feols(price ~ distance + 
                type + 
                distance:type, 
              data = Dallas_listings)
tidy(reg1, conf.int = TRUE)

