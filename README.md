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
