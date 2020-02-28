# Carrega as biliotecas necessárias
library(tidyverse)

# Carrega base de dados já tratada
rent <- read_rds("data/rent_clean.rds")

# Verificar a ocorrência em cada estado Brasileiro
table(rent$state)

# Sugiro separar os estados com um volume de observações maiores que 300 e
# agrupar os estados onde não há dados suficientes para fazer uma análise.
# Estados com menos de 300 observações serão considerados como outros

BA <- rent %>% 
  filter(state == "Bahia")

MG <- rent %>% 
  filter(state == "Minas Gerais")

RJ <- rent %>% 
  filter(state == "Rio de Janeiro")

SP <- rent %>% 
  filter(state == "São Paulo")

othersStates <- c("Alagoas",
                   "Amazonas",
#                   "Bahia",
                   "Ceará",
                   "Distrito Federal",
                   "Espírito Santo",
                   "Goiás",
                   "Maranhão",
                   "Mato Grosso",
                   "Mato Grosso do Sul",
#                   "Minas Gerais",
                   "Pará",
                   "Paraíba",
#                   "Paraná",
                   "Pernambuco",
                   "Piauí",
#                   "Rio de Janeiro",
                   "Rio Grande do Norte",
                   "Rio Grande do Sul",
                   "Santa Catarina",
#                   "São Paulo",
                   "Sergipe",
                   "Tocantins")

others <- rent %>% 
  filter(state == othersStates)

# Verificar as cidades no estado SP
table(SP$city) %>% 
  view()

# Verificar as cidades no estado RJ
rent %>% 
  filter(state == "Rio de Janeiro" & city != "Rio de Janeiro")

# Verificar as cidades no estado MG
rent %>% 
  filter(state == "Minas Gerais")
