source("https://github.com/nhasnhas/Rstats2627/releases/download/Latest/Rstats2627.R")

nana_weighted_mean <- function(xi, wi) {
  # Calculates the weighted mean of a vector composed by xi, with weights wi
  # xi: vector of numerical values (e.g., class marks x_i)
  # wi: vector of weights or frequencies (e.g., absolute frequencies n_i)
  
  if (length(x) != length(w)) {
    stop("Error: The vectors 'x' and 'w' must have the exact same number of elements.")
  }
  
  weighted_mean <- sum(xi * wi) / sum(wi)
  return(weighted_mean)
}