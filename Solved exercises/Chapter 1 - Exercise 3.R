source("https://github.com/nhasnhas/Rstats2627/releases/download/Latest/Rstats2627.R")

# CHAPTER 1 EXERCISE LIST --- EXERCISE 3
# ----------------------------------------------------------------------------
# We are given the vector of the unique elements of a distribution vector
# (x_i), and the vector of their respective absolute frequency:
x_i <- c(3, 4, 8, 10)
n_i <- c(3, 15, 2, 4)

# We will reconstruct the original vector X from the given data:
X <- sort(rep(x_i, n_i))
cat("\nX = {", paste(X, collapse = ", "), "}\n\n")

# We calculate the median of vector X using the built-in function:
median_X <- median(X)

# We print the result:
cat("The median of vector X is Me =", median_X)
