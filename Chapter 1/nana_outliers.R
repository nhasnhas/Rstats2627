nana_outliers <- function(c_data, lower_quantile_percentage, upper_quantile_percentage, reference = "quantile", range_outliers = 1.5) {
  
  # calculate the quantile
  Q_lower <- quantile(c_data, lower_quantile_percentage)
  Q_higher <- quantile(c_data, upper_quantile_percentage)
  
  # calculate the interquantile range
  interquantile <- Q_higher - Q_lower
  
  # if we take as reference the range "quantile"
  if (reference == "quantile") {
    lower_end <- Q_lower - range_outliers * interquantile
    upper_end <- Q_higher + range_outliers * interquantile
  }
  
  # if we take as reference the "median"
  # in case is something different than median, just substitute the ME by mode, mean or whatever
  if (reference == "median") {
    ME <- quantile(c_data, 0.5)
    lower_end <- ME - range_outliers * interquantile
    upper_end <- ME + range_outliers * interquantile
  }
  
  # returns the vector with all outliers
  return(c_data[c_data < lower_end | c_data > upper_end])
  
}