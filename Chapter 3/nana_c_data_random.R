nana_c_data_random <- function(seasonal_variation, seasonal_indices_normalized) {
  
  # seasonal_variation: get it by calling nana_c_data_seasonal_variation
  # seasonal_indices_normalized: get it by calling nana_c_data_seasonal_indices
  
  # for: obtaining the random component by dividing the seasonal
  # variation index (E * A) by the normalized seasonal indices (E)
  
  return(seasonal_variation / seasonal_indices_normalized)
}
