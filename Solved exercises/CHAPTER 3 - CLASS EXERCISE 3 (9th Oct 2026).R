source("https://github.com/nhasnhas/Rstats2627/releases/download/Latest/Rstats2627.R")

# CHAPTER 3 - CLASS EXERCISE 3, PAGES 24, 30, 33, 38, 40, 42, 46, 53
# ----------------------------------------------------------------------------
library(tidyverse)
X <- c(178.2, 153.2, 185.9, 163.6, 196.3, 156.9, 197.9, 166.4, 197.3, 159.7, 
       202.6, 175.6, 209.5, 169.5, 202.4, 179.8, 200.0, 168.6, 216.1, 178.5)

# Reading the data
# Indicate the frequency of the seasonal component:
uk <-  ts(X, start = c(1980, 1), frequency = 4)

# Trend component, using a moving average of order 4:
trend <- stats::filter(uk, c(0.5, 1, 1, 1, 0.5) / 4)

# Plot the series with the trend in a different color:
plot(uk, col = "darkblue")
lines(trend, col = "forestgreen")

# Multiplicative Decomposition:
# Seasonal (E) * Random Component (A) = X/TC:

# We could do the following:
seasonal_randomM <- uk / trend
# print(seasonal_randomM)

# However, since we want to rename the columns:
# 1.) Convert the 1D time series into a 4-column matrix
cat("\nSeasonal Table (eliminating trend-cycle):\n\n")
seasonal_matrix <- matrix(seasonal_randomM, ncol = 4, byrow = TRUE)

# 2.) Assign the column names to the new matrix
colnames(seasonal_matrix) <- c("Spring", "Summer", "Autumn", "Winter")

# 3.) Add row names for the years to fully match the material's table
rownames(seasonal_matrix) <- 1980:1984
print(seasonal_matrix)

############### Unnormalized Seasonal Component: ###############
seasonal1M <- colMeans (matrix(seasonal_randomM, ncol =4, byrow = T ), na.rm= T )
cat(paste0("\nUnnormalized seasional Component = {", 
           paste(seasonal1M, collapse = ", "), "}\n"))

############### Normalize the Seasonal Component: ###############
seasonalM <- seasonal1M / mean (seasonal1M)
cat(paste0("\nNormalized seasional Component = {", 
           paste(seasonalM, collapse = ", "), "}\n"))

############### Random Component: ###############
randomM <- seasonal_randomM / seasonalM
cat(paste0("\nRandom Component = {", paste(randomM, collapse = ", "), "}\n"))

############### Deseasonalized Series: ###############
des_seasonalM <- uk / seasonalM
cat(paste0("\nDeseasonalized Series = {", 
           paste(des_seasonalM, collapse = ", "), "}\n"))

# Graph of the Deseasonal Series:
lines(des_seasonalM, col = "hotpink")

############### Regression Line: ###############
# We find a subvector, subX (vector 1:n), where n is the length of uk
subX <- seq_along(uk)

# Linear Regression:
modelSubX <- lm(des_seasonalM ~ subX)

# Calculate the predicted values of the line:
regressionLine_X <- ts(predict.lm(modelSubX), start = c(1980, 1), frequency = 4)

# Plot the deseasonalized series with the line; this is a DIFFERRENT plot from
# the one we have been doing previously, so commenting (#) the previous plot is
# advised, as well as the lines created before the following one(s), not
# related to the new plot:
plot(des_seasonalM, col = "darkcyan")
lines(regressionLine_X, col = "magenta")

