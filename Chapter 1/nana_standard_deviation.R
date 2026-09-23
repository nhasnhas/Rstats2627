nana_standard_deviation <- function(c_data) {
  
  # R gives us the sample formula, so to make it exact we multiply var by N-1/N, 
  # N being the total length of the data
  
  standard_deviation <- sqrt(var(c_data)*(length(c_data)-1)/length(c_data))
  
  return(standard_deviation)
}