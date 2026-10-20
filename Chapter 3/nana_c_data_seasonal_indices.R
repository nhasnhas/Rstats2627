nana_c_data_seasonal_indices <- function(seasonal_variation,frequency = 4, normalize = TRUE) {
  
  # seasonal_variation: get it by calling nana_c_data_seasonal_variation
  
  
  # for: calculating the average seasonal effect for each season,
  # eliminating the random component as much as possible
  # normalize = FALSE -> unnormalized seasonal indices
  # normalize = TRUE  -> normalized seasonal indices (mean = 1)
  
  
  indices <- colMeans(
    matrix(seasonal_variation, ncol = frequency, byrow = TRUE),
    na.rm = TRUE
  )
  
  if (normalize) {
    indices <- indices / mean(indices, na.rm = TRUE)
  }
  
  return(indices)
}