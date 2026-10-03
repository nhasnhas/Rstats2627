source("https://github.com/nhasnhas/Rstats2627/releases/download/Latest/Rstats2627.R")

# CHAPTER 1 EXERCISE LIST --- EXERCISE 5
# ----------------------------------------------------------------------------
# First, we will translate the provided data from the table into variables.

# 1.) Total population:
N <- 663804

# 2.) Intervals (they will be defined by two vectors: onee for the lower bound
#     and another for the upper bound):
lower_bound_X <- c(0, 2, 10, 50)
upper_bound_X <- c(2, 10, 50, 100)

# 3.) Heights (h_i) and widths (a_i):
h_i <- c(3.22, 2.42, 1.34, 0.41)
a_i <- c(2, 8, 40, 50)

# -----o-----o-----o-----o-----o-----o-----o-----o-----
# A) We will construct the base data frame:
freq_table <- data.frame(
  interval = paste0("[", lower_bound_X, ", ", upper_bound_X, ")"), 
  a_i = a_i,
  h_i = h_i
)

# B) We will calculate the Relative Frequency (%) as the area of the bar 
#    (a_i * h_i):
freq_table$f_i_percentage <- freq_table$a_i * freq_table$h_i

# C) We will calculate the Absolute frequency (Inhabitants) by normalising the
#    the percentages:
freq_table$n_i <- 
  (freq_table$f_i_percentage / sum(freq_table$f_i_percentage)) * N

# -----o-----o-----o-----o-----o-----o-----o-----o-----
# Finally, we print the table:
cat("\n>----{ Frequency Distribution - Population Census of 1990 }----<\n")
print(freq_table)







