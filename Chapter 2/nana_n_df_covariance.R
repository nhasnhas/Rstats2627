


nana_n_df_covariance <- function(n_df, colX_name, colY_name){
  # Takes a n_df and two of its column names for which we want the covariance
  # Returns a number (covariance for the two variables)
  
  # Examples:
  #   nana_n_df_covariance(data, "X", "Y") # same as doing nana_n_df_covariance(data, "Y", "X")
  #   nana_n_df_covariance(n_df, "width", "height")
  
  return (
    (1/nana_n_df_N(n_df)) * 
    sum(
      (data[[colX_name]]-nana_n_df_mean(n_df,colX_name)) * 
      (data[[colY_name]]-nana_n_df_mean(n_df,colY_name)) * 
      data$n
    )
  )
}