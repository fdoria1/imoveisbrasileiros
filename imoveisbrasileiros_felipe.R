#Análise Exploratória

install.packages("DataExplorer")
library(DataExplorer)

sell<-read_rds("C:\\Users\\DATA MINING T15\\Documents\\imoveisbrasileiros\\data\\sell.rds")

plot_str(sell)
plot_missing(sell)

install.packages("dplyr")
install.packages("tidyverse")
library(dplyr)
library(tidyverse)


grep("surface_total_in_m2", colnames(sell))

sell[,"index_na"]<-ifelse(is.na(sell[,14])==TRUE,1,0)

class(sell[,"index_na"])
summary(sell$index_na)

base<-filter(sell,sell$"index_na"==0)


base_rent<-filter(base,base$"operation"=="rent")

summary(base_rent$"surface_total_in_m2")
quantile(base_rent$"surface_total_in_m2")



limite_superior<-180+(180-79)*1.5
limite_inferior<-1

base[,"index_outlier"]<-ifelse(base$"surface_total_in_m2">limite_inferior&base$"surface_total_in_m2"<limite_superior,0,1)

base<-filter(base,base$"index_outlier"==0)

summary(base$"surface_total_in_m2")
hist(base$"surface_total_in_m2")

test<-filter(base,base$"surface_total_in_m2"==0)

