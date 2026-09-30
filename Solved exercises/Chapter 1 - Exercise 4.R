source("https://github.com/nhasnhas/Rstats2627/releases/download/Latest/Rstats2627.R")

# CHAPTER 1 EXERCISE LIST --- EXERCISE 3
# ----------------------------------------------------------------------------
# We are given the vector of the unique elements of a distribution vector
# (x_i), and the vector of their respective absolute frequency:
x_i <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11)
n_i <- c(2, 9, 14, 20, 18, 15, 9, 6, 4, 2, 1)

# We will reconstruct the original vector X from the given data:
X <- sort(rep(x_i, n_i))
cat("\nX = {", paste(X, collapse = ", "), "}\n\n")

# 1.) We calculate the mean of X using its respective built-in function:
mean_X <- mean(X)
cat("1.) Mean of X, μ =", mean_X)

# 2.) We calculate the median of X using its respective built-in function:
median_X <- median(X)
cat("\n2.) Median of X, Me =", median_X)

# 3.) We calculate the mode of X using its respective built-in function:
mode_X <- nana_mode(X)
cat("\n3.) Mode of X, Mo =", mode_X)

# 4.) We will calculate the quartiles Q_1 and Q_3:
Q1_X <- nana_quantile(X, 0.25*1)
Q3_X <- nana_quantile(X, 0.25*3)
cat("\n4.) Quartiles: Q_1 =", Q1_X, "and Q_3 =", Q3_X)