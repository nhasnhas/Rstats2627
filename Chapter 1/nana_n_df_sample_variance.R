nana_n_df_sample_variance <- function(n_df, col_name){
  # ctrl+F: s2n, s^2_n, s_n^2, sn squared, s sub n squared
  
  N <- nana_n_df_N(n_df)
  avg <- nana_n_df_mean(n_df, col_name)
  
  xi_minus_avg_squared_times_ni <- n_df$n * (n_df[[col_name]] - avg)^2
  
  
  return(
    sum(xi_minus_avg_squared_times_ni)/N
  )
}