nana_n_df_linear_regression <- function(n_df, colX_name, colY_name){
  # Takes a n_df and two column names, for calculating R_{X/Y}
  
  # Returns a c() with the intercept (a) and slope (b) (x=a+b*y) 
  # Examples:
  #   nana_n_df_linear_regression(data, "X", "Y")
  #   nana_n_df_linear_regression(n_df, "Height", "Weight")

  df <- internal_check_fi_df(n_df, c(colX_name, colY_name))

  N <- sum(df$fi)
  sum_x <- sum(df[[colX_name]] * df$fi)
  sum_y <- sum(df[[colY_name]] * df$fi)
  sum_x_squared <- sum(df[[colX_name]]^2 * df$fi)
  sum_xy <- sum(df[[colX_name]] * df[[colY_name]] * df$fi)

  b <- (N * sum_xy - sum_x * sum_y) / (N * sum_x_squared - sum_x^2)
  a <- (sum_y - b * sum_x) / N

  return(c(a = a, b = b))
}