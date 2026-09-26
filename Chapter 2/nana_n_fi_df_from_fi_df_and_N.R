nana_n_fi_df_from_fi_df_and_N <- function(fi_df, N){
  # Takes a fi_df and N and adds the fi column
  # Returns a n_fi_df (a dataframe with the n and fi columns)
  
  # Examples:
  #   nana_n_fi_df_from_fi_df_and_N(data, 7)
  #   n_fi_df <- nana_n_fi_df_from_fi_df_and_N(n_df, 0.14)
  #   nana_n_fi_df_from_fi_df_and_N(my_df, 1)
  
  n = fi_df$fi * N # calculate the n column
  
  n_fi_df = cbind(fi_df,n) # bind the n column to the df
  
  return(n_fi_df)
}