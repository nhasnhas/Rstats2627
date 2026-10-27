nana_linear_regression_manual <- function(x, y) {
  # Calculates the coefficients of a simple linear regression manually.
  # Check that both inputs are numeric.
  if (!is.numeric(x) || !is.numeric(y)) {
    stop("x and y must be numeric.")
  }
  
  # Check that both vectors have the same length.
  if (length(x) != length(y) || length(x) < 2) {
    stop("x and y must have the same length of at least 2.")
  }
  
  # Check that the inputs do not contain missing values.
  if (anyNA(x) || anyNA(y)) {
    stop("x and y must not contain missing values.")
  }
  
  # Check that x has variation.
  if (length(unique(x)) < 2) {
    stop("x must contain at least two distinct values.")
  }
  
  # Calculate the means of x and y.
  x_mean <- mean(x)
  y_mean <- mean(y)
  
  # Calculate the slope of the regression line.
  b <- sum((x - x_mean) * (y - y_mean)) /
    sum((x - x_mean)^2)
  
  # Calculate the intercept of the regression line.
  a <- y_mean - b * x_mean
  
  # Return both coefficients.
  return(c(intercept = a, slope = b))
}
