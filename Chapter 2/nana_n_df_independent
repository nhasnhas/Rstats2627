
nana_n_df_independent <- function(n_df) {

  # Get the distinct values of X and Y
  x_values <- unique(n_df$X)
  y_values <- unique(n_df$Y)

  # Assume independence until proven otherwise
  independent <- TRUE

  # Check every possible pair (X, Y)
  for (i in seq_along(x_values)) {

    for (j in seq_along(y_values)) {

      x <- x_values[i]
      y <- y_values[j]

      # Marginal probability of X = x
      p_x <- sum(n_df$n[n_df$X == x]) / sum(n_df$n)

      # Marginal probability of Y = y
      p_y <- sum(n_df$n[n_df$Y == y]) / sum(n_df$n)

      # Joint probability of X = x and Y = y
      p_xy <- sum(n_df$n[n_df$X == x & n_df$Y == y]) /
        sum(n_df$n)

      # Check independence
      if (abs(p_xy - p_x * p_y) > 0.000001) {
        independent <- FALSE
        return(independent)
      }
    }
  }

  return(independent)
}
