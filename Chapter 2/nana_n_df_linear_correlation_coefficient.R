nana_n_df_linear_correlation_coefficient <- function(n_df, colX_name, colY_name){
  # Takes a df and the name of two of its columns for witch 
  # we want to calculate the coefficient
  
  # returns a number (the linear correlation coefficient)
  
  cov <- nana_n_df_covariance(n_df,colX_name, colY_name)
  
  x_sd = nana_standard_deviation(
    nana_n_df_to_c_data(n_df, colX_name)
  )
  
  y_sd = nana_standard_deviation(
    nana_n_df_to_c_data(n_df, colY_name)
  )
  
  return(
    cov /
    (x_sd * y_sd)
  )
}