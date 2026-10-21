nana_fi_df_median <- function(fi_df, col_name) {
  fi_df <- internal_check_fi_df(fi_df)
  
  # Ensure the data is sorted by the target column
  fi_df <- fi_df[order(fi_df[[col_name]]), ]
  
  cum_freq <- 0
  
  for (i in seq_along(fi_df$fi)) {
    cum_freq <- cum_freq + fi_df$fi[i]
    
    if (cum_freq >= 0.5) {
      return(fi_df[[col_name]][i])
    }
  }
}
