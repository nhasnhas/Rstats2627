nana_mean_deviation <- function(c_data, p = mean(c_data)) {
  #c_data refers to a numeric vector containing the observations
  #p is the reference value used to calculate the deviations.
  #By default, p is the arithmetic mean of c_data. (unless specified otherwise).
  
  # We calculate the absolute deviations from p
  deviations <- abs(c_data - p)
  
  # We calculate the mean of the absolute deviations
  mean_deviation <- mean(deviations)
  
  # We return the calculated mean deviation
  # the mean absolute deviation from the chosen reference value.
  return(mean_deviation)
}

