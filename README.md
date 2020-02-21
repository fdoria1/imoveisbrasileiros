# Imoveis Brasileiros

Campos da base original:

[1] "created_on"                 "operation"                  "property_type"             
 [4] "place_name"                 "place_with_parent_names"    "geonames_id"               
 [7] "lat.lon"                    "lat"                        "lon"                       
[10] "price"                      "currency"                   "price_aprox_local_currency"
[13] "price_aprox_usd"            "surface_total_in_m2"        "surface_covered_in_m2"     
[16] "price_usd_per_m2"           "price_per_m2"               "floor"                     
[19] "rooms"                      "expenses"                   "properati_url"             
[22] "description"                "title"                      "image_thumbnail"   

Campos da base final:



Campos utilizados

Idéias:

    A - 1º agrupar os registros - clusterizar? ou definir por variáveis (ex: região;metragem;nº de quartos)
        2º criar variáveis valor: ex média/mediana aluguél, média/mediana venda, juros selic valor venda...
        3º REgressão logistica: vendedor - grupo 1: vende e investe; grupo 2: aluga
                                comprador - grupo 1: compra; grupa 2: aluga e investe

Sugestões Carla - UTILIZAR A 3A IDEIA - comparar as bases sell e rent em relação ao percentual preço por m2 por bairro.
1. Utilizar apenas dados de STATE: SÃO PAULO, CITY: SÃO PAULO - para fazermos uma comparação entre os "bairros" de SP. - Base SELL teria 141.867 dados e base RENT teria 19.829
2. dentro de cada base, temos apartment, house,store e PH. Utilizariamos apenas apartament e house
3. Fazer uma media de preço por m2, por Bairro 
4. Montar cluster dessa tabela media preço por m2 por Bairro
5.Fiz a centroid e depois k-means com 27 e 25 clusters
6. 






