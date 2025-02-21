## ESRI ECCE App Challenge 2025
## Harry Cheung, Brandon Que, Matthew Woodward
## cancensus.R - queries to CensusMapper/StatsCan API



## SETUP
install.packages("cancensus")
install.packages("readr")
library(cancensus)

key = 'CensusMapper_e995d5dd011300979ad9546c5fa9dafe'
cache = 'C:/Users/brand/Downloads/ecce'

set_cancensus_api_key(key, install=TRUE, overwrite=TRUE)
set_cancensus_cache_path(cache, install=TRUE, overwrite=TRUE)

vectors <- list_census_vectors("CA21")
regions <- list_census_regions("CA21", use_cache = TRUE)
write.csv(vectors, "C:/Users/brand/Downloads/ecce/vectors.csv")
write.csv(regions, "C:/Users/brand/Downloads/ecce/regions.csv")



## HOUSING ATTRIBUTES (2021)
ECCE_data <- get_census(dataset='CA21', regions=list(CSD=c("3530016")),
                        vectors=c("v_CA21_4237","v_CA21_4238","v_CA21_4239", ## Households by tenure (total, owners, renters)
                                  "v_CA21_4313","v_CA21_4315", ## Tenant households, % spending more than 30% of income on shelter costs
                                  "v_CA21_4317","v_CA21_4318"), ## Median and mean shelter costs for rented dwellings
                        level='DA', use_cache=FALSE, quiet=TRUE)
write.csv(ECCE_data, "C:/Users/brand/Downloads/ecce/WaterlooCSD.csv")
