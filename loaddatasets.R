# Carrega arquivo csv realiza tratamentos nas colunas e converte em rds

# Instalação dos pacotes necessários para carregar e tratar os datasets
install.packages("readr")
install.packages("readxl")
install.packages("tidyr")

# Carrega as bibliotecas
library(readr)
library(readxl)
library(tidyverse)

# Carregar o dataset rent e sell
rent <- read.csv("data/properati-BR-2016-11-01-properties-rent.csv", encoding="UTF-8")
sell <- read.csv("data/properati-BR-2016-11-01-properties-sell.csv", encoding="UTF-8")

# Convert dataset em rds
write_rds(rent, "data/rent.rds" )
write_rds(sell, "data/sell.rds" )

# Carregar o dataset em rds
rent <- read_rds("data/rent.rds")
sell <- read_rds("data/sell.rds")

# Colunas que serão criadas
new_columns <- c("to_remove","country", "state", "city", "neighborhood")

# Colunas que serão removidas
remove_columns <- c("to_remove", "country", "title", "description", "properati_url", "image_thumbnail" )

# Separa a coluna place_with_parent_names em novas colunas contidas na variável new_columns
rent <- rent %>% 
  separate(place_with_parent_names, new_columns, sep = "\\|")

sell <- sell %>% 
  separate(place_with_parent_names, new_columns, sep = "\\|")

# Remove as colunas contidas na variável remove_columns
rent <- rent %>% 
  select(-remove_columns)

sell <- sell %>% 
  select(-remove_columns)

# Salva datasets em rds já tratado
write_rds(rent, "data/rent.rds" )
write_rds(sell, "data/sell.rds" )
