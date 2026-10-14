# Chapter 3, Page 61
# Autocorrelation Function from the slides of Chapter 3

nana_autoCorrel <- function(c_data, frequency) {
  # Remove the last n data points
  xx1 <- head(c_data,-frequency)
  # Remove the first n data points
  xx2 <- tail(c_data,-frequency)
  # correlation
  sqrt(summary(lm(xx1 ~ xx2))$r.squared)
}