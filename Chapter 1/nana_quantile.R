nana_quantile <- function(c_data, proportion) {
  # Returns the quantile of the specified proportion using algorithm type 2.
  # Unlike R's default continuous interpolation (type 7), this method is 
  # designed for discrete data. It returns an exact observation from the 
  # provided vector c_data, EXCEPT when the target proportion falls exactly 
  # between two adjacent data points, in which case it returns their average.
  
  # Calculates the quantile, using the parsed arguments of the function as 
  # its characteristics:
  quantile(c_data, probs = proportion, type = 2)
}