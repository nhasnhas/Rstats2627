# Chapter 3, Page 61
# Autocorrelation Function from the slides of Chapter 3.
# Purpose: calculates the autocorrelation and tells you if the provided c_data
# has a cycle

nana_autoCorrel <- function(c_data, frequency) {
  # Remove the last n data points
  xx1 <- head(c_data,-frequency)
  # Remove the first n data points
  xx2 <- tail(c_data,-frequency)
  # correlation
  correlation <- sqrt(summary(lm(xx1 ~ xx2))$r.squared)
  
  cat("\nAutocorrelation:", correlation)
  
  hasCycle <- identical(1, round(correlation, digits = 0))
  cat("\nDoes the data have a cycle?:", hasCycle)
}