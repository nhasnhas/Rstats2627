nana_n_df_central_moment <- function(fi_df, colX_name, colY_name, r, s) {
  # Takes a fi_df, the column names for which we want to calculate the central moment
  # and the orders, r and s
  
  # Returns a number (the central moment for the variables)
  
  # Examples:
  #   nana_n_df_central_moment(data , "X", "Y", 1, 2)
  #   nana_n_df_central_moment(fi_df, "width", "height", 3, 1)
  #   nana_n_df_central_moment(n_df, "Height", "Weight", 1, 1)
  
  df <- internal_check_fi_df(fi_df, c(colX_name, colY_name))
  
  X_mean <- nana_fi_df_mean(df, colX_name)
  Y_mean <- nana_fi_df_mean(df, colY_name)
  
  return(
    nana_fi_df_moment_of_order_rs_with_respect_to_point_ab(
      df,
      colX_name, colY_name,
      r, s,
      X_mean, Y_mean
    )
  )
}