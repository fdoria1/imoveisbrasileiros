# Carrega função getRM
source("func_getRM.R")

# Instala pacotes necessários
install.packages("fastDummies")

# Carrega as biliotecas necessárias
library(tidyverse)
library(fastDummies)

# Carrega base de dados já tratada e filtro para estado de São Paulo
rentSP <- read_rds("data/rent_clean.rds") %>% 
  filter(state == "São Paulo")

rentSP$state <- as.factor(rentSP$state)
rentSP$city <- as.factor(rentSP$city)

# Apresenta o número de ocorrencias para cada cidade do estado
table(rentSP$city)

# Cria nova variável com a informação de qual região metropolitana o imóvel pertence.
rentSP <- rentSP %>%
  mutate(RM = map_chr(city, city2mr))

# Apresenta o número de ocorrencias por região metropolitana
table(rentSP$RM)

# Apresenta o número de ocorrências por tipo de propriedade
table(rentSP$property_type)

dummyVars <- c("RM", "property_type")
rentSPDum <- dummy_cols(rentSP, select_columns = dummyVars,remove_selected_columns = TRUE)

rentSPDum <-rentSPDum %>% 
  select(-c("created_on", "operation", "place_name", "state", "city"))

head(rentSP)

cor(rentSPDum)
rentSP_teste <- rentSP %>% 
  filter(RM == "RMSP" & (property_type == "apartment" | property_type == "house"))

rentSP_teste <- rentSP %>% 
  filter(RM == "RMC")

rentSP_teste <- rentSP %>% 
  filter(RM == "RMVale")

rentSP_teste <- rentSP %>% 
  filter(RM == "RMS")

rentSP_teste <- rentSP %>% 
  filter(RM == "RMBS")

rentSP_teste <- rentSP %>% 
  filter(RM == "RMRP")

rentSP_teste <- rentSP %>% 
  filter(RM == "AUP")

rentSP_teste <- rentSP %>% 
  filter(RM == "AGJ")

rentSP_teste <- rentSP %>% 
  filter(RM == "OTHERS")

# modelo <- lm(price ~ . -price_aprox_local_currency -property_type_store -RM_AGJ -RM_RMSP, data = rentSPDum)
modelo <- lm(price ~ + rooms + surface_covered_in_m2 + price_per_m2, data = rentSP_teste)
summary(modelo)


ggplot(rentSP, aes(y = price, x = rooms)) + geom_point()

