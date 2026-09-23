nana_coefficient_of_variation <- function(standard_deviation, c_data) {
  CV <- standard_deviation / mean(c_data)
  return(CV)
}