source("https://github.com/nhasnhas/Rstats2627/releases/download/Latest/Rstats2627.R")

# CHAPTER 1 EXERCISE LIST --- EXERCISE 1
# ----------------------------------------------------------------------------
# We will sort the provided set of numbers:
X <- sort(c(21.8, 40.8, 25.1, 34.6, 39.1, 37.8, 38.4, 36.0, 34.4, 30.1,
            25.1, 37.4, 38.0, 25.1, 37.8, 29.4, 34.3, 27.2, 23.8, 29.9,
            26.8, 36.8, 25.0, 36.1, 24.9, 38.5, 23.8, 36.8, 31.7, 20.6,
            29.8, 24.3, 36.5, 39.0, 40.9, 27.4, 22.2, 28.2, 31.1, 31.5,
            38.9, 24.6, 22.3, 39.1, 25.9, 21.6, 24.1, 29.4, 22.1, 28.9,
            42.4, 38.5, 43.8, 25.9, 26.5, 33.8, 20.8, 37.5, 37.6, 38.4,
            27.4, 28.5, 31.5, 28.5, 25.1, 31.3, 22.3, 25.3, 22.6, 22.3,
            20.4, 31.1, 21.2, 28.7, 24.9, 23.2, 26.4, 20.6, 27.8, 26.9,
            30.2, 20.5, 31.1, 30.0, 26.7, 25.4, 25.1, 30.3, 28.8, 23.6,
            25.3, 26.6, 23.8, 28.5, 27.0, 23.9, 21.9, 31.9, 26.0, 23.5))

cat("\nX = {", paste(X, collapse = ", "), "}\n")

# -----o-----o-----o-----o-----o-----o-----o-----o-----
# SECTION A) Calculate the Mean.

# We will use the built-in formula for this calculation:
mean_X <- mean(X)
cat("\na) Mean of X, µ =", mean_X)

# -----o-----o-----o-----o-----o-----o-----o-----o-----
# SECTION B) Calculate the Median.

# Again, we will use the built-in formula:
median_X <- median(X)
cat("\nb) Median of X, Me =", median_X)

# -----o-----o-----o-----o-----o-----o-----o-----o-----
# SECTION C) Calculate the Interquartile Range.

# We could use either the built-in formula (1), or the one we've coded for our
# GitHub repository (2).

# (1):
# IQR_X <- IQR(X)

# (2):
IQR_X <- nana_IQR(X)

# We print the result:
cat("\nc) Interquartile Range of X, IQR =", IQR_X)

# -----o-----o-----o-----o-----o-----o-----o-----o-----
# SECTION D) Calculate the Standard Deviation.

# Since there is no direct built-in formula to calculate it, we will use the
# formula we have coded for our GitHub repository:
std_dev_X <- nana_standard_deviation(X)

# We will round the result to match the one shown on the exercises sheet:
cat("\nd) Standard Deviation of X, σ =", std_dev_X)

# -----o-----o-----o-----o-----o-----o-----o-----o-----
# SECTION E) Calculate Pearson's Coefficient of Variation.

# We will use our own formula, even if it is a very simple operation,
# again rounding it:
CV_X <- nana_coefficient_of_variation(std_dev_X, X)
cat("\ne) Pearson's Coefficient of Variation of X, CV =", CV_X)

# -----o-----o-----o-----o-----o-----o-----o-----o-----
# SECTION F) Calculate the Skewness Coefficient (or, Coefficient of Asymmetry).

# We could calculate it using Fisher's formula (which we have coded for our
# GitHub repository), given that the answer for this section on the exercises
# sheet is given with the according notation:
g1_X <- nana_skewness_Fisher(X)

# Again, we round the result:
cat("\nf) Fisher's Skewness Coefficient of X, g_1 =", g1_X)

# We specify the type of skew of distribution X:
if(g1_X > 0) {
  cat("; positive/right skew.")
} else if (g1_X < 0) {
  cat("; negative/left skew.")
} else if (g1_X == 0){
  cat("; symmetric distribution.")
}

# -----o-----o-----o-----o-----o-----o-----o-----o-----
# SECTION G) Calculate the Fisher's Kurtosis Coefficient (or, Coefficient of
# Peakedness).

# We will use our formula:
g2_X <- nana_kurtosis(X)
cat("\ng) Fisher's Kurtosis Coefficient of X, g_2 =", g2_X)

# We specify the type of peakedness of distribution X:
if(g2_X > 0) {
  cat("; Leptokurtic (more peaked than the normal).")
} else if (g2_X < 0) {
  cat("; Platyukurtic (less peaked than the normal).")
} else if (g2_X == 0){
  cat("; Mesokurtic (same peakedness as the normal).")
}

