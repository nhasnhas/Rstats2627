source("https://github.com/nhasnhas/Rstats2627/releases/download/Latest/Rstats2627.R")

# CHAPTER 3 - CLASS EXERCISE 5, PAGE (no sé bro, se lo ha inventado)
# ----------------------------------------------------------------------------
# Bug reports per quarter for the main product (simulated data, not INE)
# 2019Q_1 - 2023Q_4, n = 20; use the provided data (X)
# ----------------------------------------------------------------------------
library(tidyverse)

X <-  c(412, 365, 398, 471,
        438, 389, 421, 502,
        466, 410, 449, 530,
        489, 437, 470, 561,
        515, 458, 497, 588)

# Indicate the frequency of the seasonal component (quarterly bug reports).
# We can do it using our own function (first line below, commented), or using
# the built-in function (line following the line below):
# bug_report_time_seq <- nana_c_data_time_series_to_df(X, 4, 2019, 1)
bug_report_time_seq <- ts(X, start = c(2019, 1), frequency = 4)
cat("\nQuarterly Bug Report Data Table:\n\n")
print(bug_report_time_seq)

# We will calculate the trend-cycle component, using a moving average (order 4):
trend <- stats::filter(bug_report_time_seq, c(0.5, 1, 1, 1, 0.5) / 4)

# We will plot the time series (quarterly bug reports, which is a seasonal
# component) with its trend:
plot(bug_report_time_seq, col = "darkblue")
lines(trend, col = "hotpink")

# Since we only want the seasonal and the random components,we will eliminate
# the trend from the table.
# For that, we do a multiplicative decomposition: 
#                 Seasonal (E) * Random Component (A) = X/TC
seasonal_random_Mult <- bug_report_time_seq / trend
print(seasonal_random_Mult)

# We will calculate the UNNORMALIZED seasonal component.
# We do this to find the AVERAGE of the quarterly values across all years to
# eliminate the random component (A) (not taking into account NA values). 
# This calculates the raw, unnormalized seasonal variation indices, which must
# later be mathematically adjusted to sum exactly to 4 (or 400%) (due to there 
# being 4 quarters in a year)
matrix_seasonal_random_Mult <- matrix(seasonal_random_Mult,
                                      ncol = 4, byrow = TRUE)
seasonal_unnorm_Mult <- colMeans(matrix_seasonal_random_Mult, na.rm = TRUE)

cat(paste0("\nUnnormalized Seasonal Component:\n{", 
           paste(seasonal_unnorm_Mult, collapse = ", "), "}\n"))

# We will calculate the NORMALIZED seasonal component.
# We will scale the raw seasonal averages so their overall mean equals exactly
# 1 (summing to 4 for quarterly data). This mathematical correction ensures the
# indices can safely be used to deseasonalize the data without distorting the
# true annual totals
seasonal_Mult <- seasonal_unnorm_Mult / mean(seasonal_unnorm_Mult)
cat(paste0("\nNormalized seasional Component:\n{", 
           paste(seasonal_Mult, collapse = ", "), "}\n"))

# We will calculate the deseasonalized series.
# Removes predictable seasonal fluctuations from the original data to reveal
# the true underlying trend and allow for accurate period-to-period comparisons.
deseasonalized_Mult <- bug_report_time_seq / seasonal_Mult
cat(paste0("\nDeseasonalized Series:\n{", 
           paste(deseasonalized_Mult, collapse = ", "), "}\n"))

lines(deseasonalized_Mult, col = "green")

# We will calculate the Regression Line (True Trend).
# It establishes the global trajectory of your data over time, which is
# essential for forecasting future values:
time_sequence_bugs <- seq_along(bug_report_time_seq)
model <- lm(deseasonalized_Mult ~ time_sequence_bugs)
regression_line_bugs <- ts(predict.lm(model), start = c(2019, 1), frequency = 4)
cat("\nModel:")
print(model)

# We plot the deseasonalized series and overlay the regression line in red
plot(deseasonalized_Mult, col = "purple")
lines(regression_line_bugs, col = "lightcoral")
