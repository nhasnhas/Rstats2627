nana_skewness_Pearson <- function(c_data, mode, standard_deviation){
  skewness_Pearson <- (mean(c_data) - mode)/standard_deviation
  
  # Interpretation: 
  # result > 0 then right or positive skew 
  # result = 0 then symmetric
  # result < 0 then left or negative skew
  
  return(skewness_Pearson)
}