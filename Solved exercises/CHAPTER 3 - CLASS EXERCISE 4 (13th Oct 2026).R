source("https://github.com/nhasnhas/Rstats2627/releases/download/Latest/Rstats2627.R")

# CHAPTER 3 - CLASS EXERCISE 4, PAGE 56
# ----------------------------------------------------------------------------
library(tidyverse)

X <- c(33742, 35401, 36147, 38067, 34149, 36176, 37485, 39047, 34783, 37042, 
        38008, 40132, 36466, 38680, 39976, 42273, 39131, 40780, 41852, 43684, 
        38729, 40427, 41576, 43886, 39131, 40394, 40956, 42959, 38714, 40062, 
        41152, 43460, 38695, 39780, 40923, 44093, 40777, 41778, 43160, 45897, 
        41947, 44061, 44378, 47237, 43315, 43396, 44843, 46835, 42833, 43548, 
        44637, 47107, 42552, 43526, 45039, 47940, 43740, 45007, 46667, 49325, 
        44878, 46234, 47055, 50318, 46354, 47260, 48883, 52605, 48527, 50237,
        51592, 55152, 50451, 52294, 54633, 58802, 53990, 55477, 57850, 
        61978)

# Indicate the frequency of the seasonal component (quarterly car sales data):
qrt_car_sales <- ts(X, start = c(1969, 1), frequency = 4)
cat("\nQuarterly Car Sales Data Table:\n\n")
print(qrt_car_sales)

# We will calculate the trend component, using a moving average of order 4:
trend <- stats::filter(qrt_car_sales, c(0.5, 1, 1, 1, 0.5) / 4)

# We will plot the time series (quarterly car sales, which is a seasonal
# component) with its trend:
plot(qrt_car_sales, col = "darkblue")
lines(trend, col = "hotpink")

# Since we only want the seasonal and the random components,we will eliminate
# the trend from the table.
# For that, we do a multiplicative decomposition: 
#                 Seasonal (E) * Random Component (A) = X/TC
seasonal_random_Mult <- qrt_car_sales / trend
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
deseasonalized_Mult <- qrt_car_sales / seasonal_Mult
cat(paste0("\nDeseasonalized Series:\n{", 
           paste(des_seasonalM, collapse = ", "), "}\n"))

lines(deseasonalized_Mult, col = "green")





