nana_index_numbers <- function(c_data, base_period = 1) {
  # Calculates simple index numbers using a selected base period.
  # The base period can be specified as a position in the vector.
  
  # Check that the input data are numeric.
  if (!is.numeric(c_data) || length(c_data) == 0) {
    stop("c_data must be a non-empty numeric vector.")
  }
  
  # Check that the base period is a valid position.
  if (length(base_period) != 1 || is.na(base_period) ||
      base_period != as.integer(base_period) || base_period < 1 ||
      base_period > length(c_data)) {
    stop("base_period must be a valid position in c_data.")
  }
  
  # Check that the base value is not zero.
  if (is.na(c_data[base_period]) || c_data[base_period] == 0) {
    stop("The value in the base period must be non-zero and not NA.")
  }
  
  # Calculate the simple indices relative to the base period.
  return(c_data / c_data[base_period])
}