install.packages("DataExplorer")

library(DataExplorer)


install.packages("tidyverse")
install.packages("lubridate")

library(tidyverse)
library(lubridate)



rent<-read_rds("C://Users//celio//Documents//imoveisbrasileiros//rent.rds")

sell<-read_rds("C://Users//celio//Documents//imoveisbrasileiros//sell.rds")

View(sell)
View(rent)

names(sell)

names(rent)


missings <- subset(rent,is.na(rent$price))
View(missings)

missings01 <- subset(sell,is.na(sell$price))
View(missings01)

table(rent$`price`, useNA="always")
table(sell$`price`, useNA="always")

prop.table(table(rent$price, useNA="always"))
prop.table(table(sell$price, useNA="always"))

install.packages("expss") 
library(expss)
cro(rent$price) #frequencia absoluta
cro_cpct(rent$price) #frequencia relativa

cro(sell$price) #frequencia absoluta
cro_cpct(sell$price) #frequencia relativa

##############################
missings <- subset(rent,is.na(rent$price_aprox_local_currency))
View(missings)

missings01 <- subset(sell,is.na(sell$price_aprox_local_currency))
View(missings01)

rent02 <- subset(rent,!is.na(rent$price_aprox_local_currency))
view(rent02)
