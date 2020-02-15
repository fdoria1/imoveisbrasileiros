# Carrega arquivo csv e converte em rds

# Instalação dos pacotes necessários para carregar os datasets
install.packages(c("readr", "readxl"))


# Carrega as bibliotecas
library(readr)
library(readxl)


# Carregar o dataset rent 
rent <- read.csv("data/properati-BR-2016-11-01-properties-rent.csv")

# Carregar o dataset sell
sell <- read.csv("data/properati-BR-2016-11-01-properties-sell.csv")

# Convert dataset em rds
write_rds(rent, "data/rent.rds" )
write_rds(rent, "data/sell.rds" )

# Exemplo de carga usando read_rds
# read_rds("data/sell.rds")
