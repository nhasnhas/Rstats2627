source("https://github.com/nhasnhas/Rstats2627/releases/download/Latest/Rstats2627.R")

nana_width_ai <- function(lower_bound, upper_bound) {
  # calculates the width (ai) of an interval:
  return(upper_bound - lower_bound)
}