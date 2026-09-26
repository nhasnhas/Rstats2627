nana_n_fi_df_from_n_df <- function(n_df){
  # Takes a n_df and adds the fi column
  # Returns a n_fi_df (a dataframe with the n and fi columns)
  
  # Examples:
  #   nana_n_fi_df_from_n_df(data)
  #   n_fi_df <- nana_n_fi_df_from_n_df(n_df)
  #   nana_n_fi_df_from_n_df(my_df)
  
  
  N = nana_n_df_N(n_df)
  
  fi = n_df$n / N # calculate the fi column
  
  n_fi_df = cbind(n_df,fi) # bind the fi column to the df
  
  return(n_fi_df)
}
