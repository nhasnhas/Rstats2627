nana_quantile <- function(c_data, proportion) {
  # Returns the quantile of the specified proportion; the necessity of creating
  # this function comes from the default, built-in function quantile() does not
  # return discrete values from the provided vector c_data, and instead applies
  # a continuous linear interpolation algorithm.
  
  # Calculates the quantile, using the parsed arguments of the function as 
  # its characteristics:
  quantile(c_data, probs = proportion, type = 1)
}