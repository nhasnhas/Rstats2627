nana_quadratic_mean <- function(c_data) {
  # Calculates and returns the Root Mean Square (RMS) of a given dataset.
  # The returned value represents the overall magnitude of the data (c_data), 
  # which is particularly useful for datasets with both positive and negative numbers.
  return(sqrt(mean(c_data^2)))
}
