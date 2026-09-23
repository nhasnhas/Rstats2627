nana_IQR <- function(c_data, lower_quantile = 0.25, upper_quantile = 0.75) {
  # calculate the quantile
  Q_lower <- quantile(c_data, lower_quantile)
  Q_higher <- quantile(c_data, upper_quantile)
  
  # calculate the interquantile range
  return(Q_higher - Q_lower)
}