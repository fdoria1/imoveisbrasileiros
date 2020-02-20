# Carrega bibliotecas necessárias
library(tidyverse)

# Carrega dataset rent
rent <- read_rds("data/rent.rds")
sell <- read_rds("data/sell.rds")

# Remove todos imóveis fora do Brasil
rent <- rent %>% 
  filter(country == 'Brasil')

# Verifica a quantidade de NA's na variável price
length(which(is.na(rent$price) == TRUE))
length(which(rent$price == 0))

# Remove NA's da variável price e os que possuem valor = 0
rent <- rent %>% 
  filter(!is.na(price) | price != 0)


