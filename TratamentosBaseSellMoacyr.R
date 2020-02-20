# Carrega bibliotecas necessárias
library(tidyverse)
library(corrplot)

# Carrega dataset sell
sell <- read_rds("data/sell.rds")

# Analisando o summary e str
summary(sell)

str(sell)

# Remove todos imóveis fora do Brasil já que estamos trabalhando com imóveis brasileiros
sell <- sell %>% 
  filter(country == 'Brasil')

# Tratando imóveis que estão com preço em peso mexicano
## Olhando os valores em relação ao USD podemos notar que os valores são em BRL e não MXD
## 10 MXD aproximadamente 2,3 BRL
## Alterando MXD para BRL

# Verifica a quantidade de ocorrências
length(which(sell$currency == "MXN"))

# Substitui os MXN por BRL
sell$currency[sell$currency == "MXN"] <- "BRL"

# Verifica a quantidade e porcentagem de NA's na variável price
length(which(is.na(sell$price) == TRUE))
cat(length(which(is.na(sell$price) == TRUE)) / length(sell$price) * 100, "%")

# Verifica a quantidade e porcentagem de price = 0
length(which(sell$price == 0))
cat(length(which(sell$price == 0)) / length(sell$price) * 100, "%")

# Remove NA's da variável price e os que possuem valor = 0
sell <- sell %>% 
  filter(!is.na(price) | price != 0)

# Verificando NA's
table(is.na(sell))

sapply(sell, function(x) sum(is.na(x)))

# Removendo observações com NA
sell <- sell %>% 
  filter(!is.na(rooms)) %>% 
  filter(!is.na(price_per_m2))# %>% filter(!is.na(neighborhood))

# Selecionando somente variáveis que serão possivél de utilizar
## 100% da variável neighborhood que é diferente de NA e diferente de "" coincide com a variável place_name
## Variável neighborhood será removida
sell_variables <- c("created_on",
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
sell <- sell %>% 
  select(sell_variables)

# Verifica NA's nas variáveis que restaram
sapply(sell, function(x) sum(is.na(x)))


# Analisando registros vazios da variável city
sell %>% 
  filter(city == "") %>% 
#  mutate(city = place_name) %>% 
  arrange(desc(city))

# Ao meu ver podemos remover esses 772 casos
sell <- sell %>% 
  filter(city != "")

# Analisando o summary e str depois dos tratamentos
summary(sell)

str(sell)

# Analisando correlações
# Selecionando somentes variáveis que serão utilizadas para grafico de correlação.
sell_cor <- sell %>%
  select("price",
         "surface_covered_in_m2",
         "price_per_m2",
         "rooms")

round(cor(sell_cor),2)

# Gera gráfico de correlação da variáveis.
corrplot(cor(sell_cor))

# Selecionando somente variáveis que serão utilizadas
sell_variables <- c("created_on",
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

sell <- sell %>% 
  select(sell_variables)

# Verificando os primeiros e os últimos registros
head(sell)
tail(sell)

# Guardando base já tratada
write_rds(sell, "data/sell_clean.rds" )
