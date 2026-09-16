standard_deviation <- function(c_data){
  sqrt(var(c_data) * (length(c_data)-1) / length(c_data))
}
