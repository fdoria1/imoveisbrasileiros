# Carrega arquivo csv realiza tratamentos nas colunas e converte em rds

# Instalação dos pacotes necessários para carregar e tratar os datasets
install.packages("tidyverse")
install.packages("lubridate")

# Carrega as bibliotecas
library(tidyverse)
library(lubridate)

# Carregar o dataset rent e sell
rent <- read.csv("data/properati-BR-2016-11-01-properties-rent.csv", encoding="UTF-8")
sell <- read.csv("data/properati-BR-2016-11-01-properties-sell.csv", encoding="UTF-8")

# Colunas que serão criadas
new_columns <- c("to_remove",
                 "country",
                 "state",
                 "city",
                 "neighborhood")

# Colunas que serão removidas
remove_columns <- c("to_remove",
                    "title",
                    "description",
                    "properati_url",
                    "image_thumbnail",
                    "geonames_id",
                    "lat.lon")

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

# Corrige o formato da variável created_on
rent$created_on <- ymd(rent$created_on)
sell$created_on <- ymd(sell$created_on)

# Salva datasets em rds já tratado
write_rds(rent, "data/rent.rds" )
write_rds(sell, "data/sell.rds" )
