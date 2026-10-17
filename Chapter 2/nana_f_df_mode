nana_f_df_mode <- function(d, variable) {
  values <- unique(d[[variable]])
  modes <- c()

  for (value in values) {
    total <- sum(d$f[d[[variable]] == value])
    modes <- c(modes, total)
  }

  max_frequency <- max(modes)

  return(values[modes == max_frequency])
}