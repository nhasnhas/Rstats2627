nana_mean_squared_error <- function(c_data, p = mean(c_data)) {
  # Calculate the squared deviations from p
  squared_deviations <- (c_data - p)^2
  
  # Calculate the mean of the squared deviations
  mse <- mean(squared_deviations)
  
  return(mse)
}
