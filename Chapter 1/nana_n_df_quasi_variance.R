nana_n_df_quasi_variance <- function(n_df, col_name) {
  # ctrl + F: s2, s squared
  
  # use nana_quasi_variance if you have N and sˆ2_n
  
  N <- nana_n_df_N(n_df)
  if (N <= 1) {
    stop("Sample size (N) must be greater than 1.")
  }
  
  col_average <- sum(n_df[[col_name]] * n_df$n) / N
  s2 <- sum(((n_df[[col_name]] - col_average)^2) * n_df$n) / (N - 1)
  
  return(s2)
}

