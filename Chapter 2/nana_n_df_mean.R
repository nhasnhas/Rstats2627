nana_n_df_mean <- function(n_df, col_name){
  # Takes a n_df and the column name for which we want to calculate the mean
  # Returns a number (the mean for the variable 'col_name')
  
  # Examples:
  #   nana_n_df_mean(data , "X")
  #   nana_n_df_mean(n_df, "Y")
  #   nana_n_df_mean(my_df, "Height")
  
  N <- nana_n_df_N(n_df)
  sum_of_xi_times_ni <-  sum(data[[col_name]] * n_df$n)

  return(
    sum_of_xi_times_ni / N
  )
}