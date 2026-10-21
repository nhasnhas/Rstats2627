nana_fi_df_mode <- function(fi_df, col_name) {
  fi_df <- internal_check_fi_df(fi_df,c(col_name))
  
  values <- unique(fi_df[[col_name]])
  modes <- c()

  for (value in values) {
    total <- sum(fi_df$fi[fi_df[[col_name]] == value])
    modes <- c(modes, total)
  }

  max_frequency <- max(modes)

  return(values[modes == max_frequency])
}