nana_n_df_center_of_gravity <- function(fi_df, colX_name, colY_name) {
  # Takes a fi_df and the column names for which we want to calculate the center of gravity
  
  # Returns a c() of numbers of length 2 (the center of gravity for the variables)
  
  # Examples:
  #   nana_n_df_center_of_gravity(data , "X", "Y")
  #   nana_n_df_center_of_gravity(fi_df, "width", "height")
  #   nana_n_df_center_of_gravity(n_df, "Height", "Weight")
  
  df <- internal_check_fi_df(fi_df, c(colX_name, colY_name))
  
  X_mean <- nana_fi_df_mean(df, colX_name)
  Y_mean <- nana_fi_df_mean(df, colY_name)
  
  return(
    c(
      X_mean, Y_mean
    )
  )
}