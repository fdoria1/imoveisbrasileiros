# Carrega bibliotecas necessárias
library(tidyverse)
library(corrplot)

# Carrega dataset rent
rent <- read_rds("data/rent.rds")

# Analisando o summary e str
summary(rent)

str(rent)

# Remove todos imóveis fora do Brasil já que estamos trabalhando com imóveis brasileiros
rent <- rent %>% 
  filter(country == 'Brasil')

# Tratando imóveis que estão com preço em peso mexicano
## Olhando os valores em relação ao USD podemos notar que os valores são em BRL e não MXD
## 10 MXD aproximadamente 2,3 BRL
## Alterando MXD para BRL

# Verifica a quantidade de ocorrências
length(which(rent$currency == "MXN"))

# Substitui os MXN por BRL
rent$currency[rent$currency == "MXN"] <- "BRL"

# Verifica a quantidade e porcentagem de NA's na variável price
length(which(is.na(rent$price) == TRUE))
cat(length(which(is.na(rent$price) == TRUE)) / length(rent$price) * 100, "%")

# Verifica a quantidade e porcentagem de price = 0
length(which(rent$price == 0))
cat(length(which(rent$price == 0)) / length(rent$price) * 100, "%")

# Remove NA's da variável price e os que possuem valor = 0
rent <- rent %>% 
  filter(!is.na(price) | price != 0)

# Verificando NA's
table(is.na(rent))

sapply(rent, function(x) sum(is.na(x)))

# Removendo observações com NA
rent <- rent %>% 
  filter(!is.na(rooms)) %>% 
  filter(!is.na(price_per_m2))# %>% filter(!is.na(neighborhood))

# Selecionando somente variáveis que serão possivél de utilizar
## 100% da variável neighborhood que é diferente de NA e diferente de "" coincide com a variável place_name
## Variável neighborhood será removida
rent_variables <- c("created_on",
                    "operation",
                    "property_type",
                    "place_name",
                    "state",
                    "city",
                    "price",
                    "price_aprox_local_currency",
                    "surface_covered_in_m2",
                    "price_per_m2",
                    "rooms")
rent <- rent %>% 
  select(rent_variables)

# Verifica NA's nas variáveis que restaram
sapply(rent, function(x) sum(is.na(x)))


# Analisando registros vazios da variável city
rent %>% 
  filter(city == "") %>% 
#  mutate(city = place_name) %>% 
  arrange(desc(city))

# Ao meu ver podemos remover esses 91 casos
rent <- rent %>% 
  filter(city != "")

# Analisando o summary e str depois dos tratamentos
summary(rent)

str(rent)

# Analisando correlações
# Selecionando somentes variáveis que serão utilizadas para grafico de correlação.
rent_cor <- rent %>%
  select("price",
         "surface_covered_in_m2",
         "price_per_m2",
         "rooms")

round(cor(rent_cor),2)

# Gera gráfico de correlação da variáveis.
corrplot(cor(rent_cor))

# Selecionando somente variáveis que serão utilizadas
rent_variables <- c("created_on",
  "operation",
  "property_type",
  "place_name",
  "state",
  "city",
  "price",
  "price_aprox_local_currency",
  "surface_covered_in_m2",
  "price_per_m2",
  "rooms")

rent <- rent %>% 
  select(rent_variables)

# Verificando os primeiros e os últimos registros
head(rent)
tail(rent)

# Guardando base já tratada
write_rds(rent, "data/rent_clean.rds" )
