nana_n_df_N <- function(n_df){
  # Takes a n_df for which we want N
  # Returns a number (N)
  
  # Examples:
  #   nana_n_df_N(data)
  #   nana_n_df_N(n_df)
  #   nana_n_df_N(my_df)
  
  return(
    sum(n_df$n)
  )
}