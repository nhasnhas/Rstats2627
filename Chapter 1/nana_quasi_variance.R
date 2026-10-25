nana_quasi_variance <- function(N, s2n){
  # use nana_n_df_quasi_variance if you have the data, use this if you have s_nˆ2 and the population (N)
  
  # s2n is the sample variance, a number
  # N is the population, a number
  
  return(
    s2n * N/(N-1)
  )
}
