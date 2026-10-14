source("https://github.com/nhasnhas/Rstats2627/releases/download/Latest/Rstats2627.R")

# CHAPTER 3 - CLASS EXERCISE 6, PAGE (no sé bro, se lo ha inventado)
# ----------------------------------------------------------------------------
#        jan    feb    mar    apr    may    jun    jul    aug    sep    oct    nov    dec
# 1976 | 178.2, 156.7, 164.2, 153.2, 157.5, 172.6, 185.9, 185.8, 165.0, 163.6, 169.0, 183.1
# 1977 | 196.3, 162.8, 168.6, 156.9, 168.2, 180.2, 197.9, 195.9, 176.0, 166.4, 166.3, 183.9
# 1978 | 197.3, 173.7, 173.2, 159.7, 175.2, 187.4, 202.6, 205.6, 185.6, 175.6, 176.3, 191.7
# 1979 | 209.5, 186.3, 183.0, 169.5, 178.2, 186.7, 202.4, 204.9, 180.6, 179.8, 177.4, 188.9
# 1980 | 200.0, 188.7, 187.5, 168.6, 175.7, 189.4, 216.1, 215.4, 191.5, 178.5, 178.6, 195.6
# 1981 | 205.2, 179.6, 185.4, 172.4, 177.7, 202.7, 220.2, 210.2, 186.9, 181.4, 175.6, 195.6
#
# 1.) Plot the series with the trend in red
# 2.) Deseasonalise the data using the seasonal variation indices obtained by 
#     the moving average method
# 3.) Calculate the true trend using the least squares method
# 4.) Plot the deseasonalized series with the line
# ----------------------------------------------------------------------------
# ############################### SECTION 1.) ###############################
library(tidyverse)

X <-  c(178.2, 156.7, 164.2, 153.2, 157.5, 172.6, 185.9, 185.8, 165.0, 163.6, 
        169.0, 183.1, 196.3, 162.8, 168.6, 156.9, 168.2, 180.2, 197.9, 195.9,
        176.0, 166.4, 166.3, 183.9, 197.3, 173.7, 173.2, 159.7, 175.2, 187.4,
        202.6, 205.6, 185.6, 175.6, 176.3, 191.7, 209.5, 186.3, 183.0, 169.5,
        178.2, 186.7, 202.4, 204.9, 180.6, 179.8, 177.4, 188.9, 200.0, 188.7,
        187.5, 168.6, 175.7, 189.4, 216.1, 215.4, 191.5, 178.5, 178.6, 195.6,
        205.2, 179.6, 185.4, 172.4, 177.7, 202.7, 220.2, 210.2, 186.9, 181.4, 
        175.6, 195.6)

# Indicate the frequency of the seasonal component (monthly report).
# We can do it using our own function (first line below, commented), or using
# the built-in function (line following the line below):
# monthly_time_seq <- nana_c_data_time_series_to_df(X, 12, 1976, 1)
monthly_report_time_seq <- ts(X, start = c(1976, 1), frequency = 12)
cat("\nMonthly Data Table:\n\n")
print(monthly_report_time_seq)

# We will calculate the trend-cycle component, using a moving average (order 4):
# we can do it two ways: first line (most inefficient method, commented), or 
# the second line (most efficient method, not commented):
# trend <- stats::filter(monthly_report_time_seq, 
#                        c(0.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.5) / 12)
trend <- stats::filter(monthly_report_time_seq, c(0.5, rep(1, 11), 0.5) / 12)

# We will plot the time series (monthly report, which is a seasonal component)
# with its trend:
plot(monthly_report_time_seq, col = "darkblue")
lines(trend, col = "red")


# ############################### SECTION 2.) ###############################
# Since we only want the seasonal and the random components,we will eliminate
# the trend from the table.
# For that, we do a multiplicative decomposition: 
#                 Seasonal (E) * Random Component (A) = X/TC
seasonal_random_Mult <- monthly_report_time_seq / trend
print(seasonal_random_Mult)

# We will calculate the UNNORMALIZED seasonal component.
# We do this to find the AVERAGE of the dozen values across all years to
# eliminate the random component (A) (not taking into account NA values). 
# This calculates the raw, unnormalized seasonal variation indices, which must
# later be mathematically adjusted to sum exactly to 12 (or 1200%) (due to there 
# being 12 months in a year)
matrix_seasonal_random_Mult <- matrix(seasonal_random_Mult,
                                      ncol = 12, byrow = TRUE)
seasonal_unnorm_Mult <- colMeans(matrix_seasonal_random_Mult, na.rm = TRUE)

cat(paste0("\nUnnormalized Seasonal Component:\n{", 
           paste(seasonal_unnorm_Mult, collapse = ", "), "}\n"))

# We will calculate the NORMALIZED seasonal component.
# We will scale the raw seasonal averages so their overall mean equals exactly
# 1 (summing to 12 for dozen data). This mathematical correction ensures the
# indices can safely be used to deseasonalize the data without distorting the
# true annual totals
seasonal_Mult <- seasonal_unnorm_Mult / mean(seasonal_unnorm_Mult)
cat(paste0("\nNormalized seasional Component:\n{", 
           paste(seasonal_Mult, collapse = ", "), "}\n"))

# We will calculate the deseasonalized series.
# Removes predictable seasonal fluctuations from the original data to reveal
# the true underlying trend and allow for accurate period-to-period comparisons.
deseasonalized_Mult <- monthly_report_time_seq / seasonal_Mult
cat(paste0("\nDeseasonalized Series:\n{", 
           paste(deseasonalized_Mult, collapse = ", "), "}\n"))

lines(deseasonalized_Mult, col = "green")


# ############################### SECTION 3.) ###############################
# We will calculate the Regression Line (True Trend).
# It establishes the global trajectory of your data over time, which is
# essential for forecasting future values:
time_sequence_report <- seq_along(monthly_report_time_seq)
model <- lm(deseasonalized_Mult ~ time_sequence_report)
regression_line_report <- ts(predict.lm(model), 
                             start = c(1976, 1), frequency = 12)
cat("\nModel:")
print(model)


# ############################### SECTION 4.) ###############################
# We plot the deseasonalized series and overlay the regression line in red
plot(deseasonalized_Mult, col = "purple")
lines(regression_line_report, col = "lightcoral")






