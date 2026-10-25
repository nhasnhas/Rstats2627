source("https://github.com/nhasnhas/Rstats2627/releases/download/Latest/Rstats2627.R")

nana_class_mark_xi <- function(lower_bound, upper_bound) {
  # we calculate the class mark (xi) of an interval:
  return((lower_bound + upper_bound) / 2)
}