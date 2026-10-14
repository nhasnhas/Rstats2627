source("https://github.com/nhasnhas/Rstats2627/releases/download/Latest/Rstats2627.R")

# CHAPTER 3 - CLASS EXERCISE 7, PAGE (no sé bro, se lo ha inventado)
# ----------------------------------------------------------------------------
# Paro Nacional en tanto por ciento
# Base de Datos: "https://www.ine.es/prensa/epa_tabla.htm"
# ----------------------------------------------------------------------------
library(tidyverse)
library(rlang)

X <- c(5933.30, 5622.90, 5427.7, 5457.70, 5444.60, 5149.00, 4850.80, 4779.50, 
       4791.40, 4574.70, 4320.80, 4237.80, 4255.00, 3914.30, 3731.70, 3766.70, 
       3796.10, 3490.10, 3326.00, 3304.30, 3354.20, 3230.60, 3214.40, 3191.90,
       3313.00, 3368.00, 3722.90, 3719.80, 3703.30, 3586.30, 3467.40, 3148.70,
       3214.70, 2994.70, 3025.80, 3081.60, 3186.30, 2808.20, 2894.50, 2860.80)


# Indicate the frequency of the seasonal component (quarterly bug reports).
# We can do it using our own function (first line below, commented), or using
# the built-in function (line following the line below):
# bug_report_time_seq <- nana_c_data_time_series_to_df(X, 4, 2014, 1)
unemployment_report_time_seq <- ts(X, start = c(2014, 1), frequency = 4)
cat("\nQuarterly Unemployment Report Data Table:\n\n")
print(unemployment_report_time_seq)

# We will calculate the trend-cycle component, using a moving average (order 4):
trend <- stats::filter(unemployment_report_time_seq, c(0.5, 1, 1, 1, 0.5) / 4)

# We will plot the time series (quarterly bug reports, which is a seasonal
# component) with its trend:
plot(unemployment_report_time_seq, col = "darkblue")
lines(trend, col = "hotpink")

# Since we only want the seasonal and the random components,we will eliminate
# the trend from the table.
# For that, we do a multiplicative decomposition: 
#                 Seasonal (E) * Random Component (A) = X/TC
seasonal_random_Mult <- unemployment_report_time_seq / trend
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
deseasonalized_Mult <- unemployment_report_time_seq / seasonal_Mult
cat(paste0("\nDeseasonalized Series:\n{", 
           paste(deseasonalized_Mult, collapse = ", "), "}\n"))

lines(deseasonalized_Mult, col = "green")

# We will calculate the Regression Line (True Trend).
# It establishes the global trajectory of your data over time, which is
# essential for forecasting future values:
time_sequence_unemployment <- seq_along(unemployment_report_time_seq)
model <- lm(deseasonalized_Mult ~ time_sequence_unemployment)
regression_line_unemployment <- ts(predict.lm(model), start = c(2014, 1), 
                                   frequency = 4)
cat("\nModel:\n")
print(coef(model)[1], digits = 8)
cat("\n(Slope)\n")
print(coef(model)[2], digits = 6)

# We plot the deseasonalized series and overlay the regression line in red
plot(deseasonalized_Mult, col = "purple")
lines(regression_line_unemployment, col = "lightcoral")

# We calculate the autocorrelation of the Unemployment Report to detect if there
# is a cycle of frequency/period 4. If autoCorrel ≈ 1, there there is a cycle:
autoCorrel_unemployment <- nana_autoCorrel(X, 4)
cat("\nAutocorrelation of Unemployment Report:", autoCorrel_unemployment)

hasCycle <- identical(1, round(autoCorrel_unemployment, digits = 0))
cat("\nDoes the Unemployment Report data have a cycle?:", hasCycle)