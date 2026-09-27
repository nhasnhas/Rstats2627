nana_fi_df_mean <- function(fi_df, col_name){
  # Takes a fi_df and the column name for which we want to calculate the mean
  # Returns a number (the mean for the variable 'col_name')
  
  # Examples:
  #   nana_fi_df_mean(data , "X")
  #   nana_fi_df_mean(fi_df, "Y")
  #   nana_fi_df_mean(n_df, "Height")
  
  df <- internal_check_fi_df(fi_df, c(col_name))
  
  sum_of_xi_times_fi <-  sum(df[[col_name]] * df$fi)
  
  return(
    sum_of_xi_times_fi
  )
}

nana_n_df_mean <- function(n_df, col_name){
  # Takes a fi_df and the column name for which we want to calculate the mean
  # Returns a number (the mean for the variable 'col_name')
  
  # Examples:
  #   nana_n_df_mean(data , "X")
  #   nana_n_df_mean(my_df, "Y")
  #   nana_n_df_mean(n_df, "Height")
  
  return(
    nana_fi_df_mean(n_df, col_name)
  )
}