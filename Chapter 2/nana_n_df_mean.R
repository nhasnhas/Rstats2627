nana_n_df_mean <- function(n_df, col_name){
  # Takes a n_df and the column name for which we want to calculate the mean
  # Returns a number (the mean for the variable 'col_name')
  
  # Examples:
  #   nana_n_df_mean(data , "X")
  #   nana_n_df_mean(n_df, "Y")
  #   nana_n_df_mean(my_df, "Height")

  return(
    sum(data[[col_name]] * n_df$n)/nana_n_df_N(n_df)
  )
}