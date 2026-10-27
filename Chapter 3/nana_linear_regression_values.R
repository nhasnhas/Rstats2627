nana_linear_regression_values <- function(x, coefficients) {
  # Calculates the estimated values of a linear regression line.
  # Check that x is numeric.
  if (!is.numeric(x)) {
    stop("x must be numeric.")
  }
  
  # Check that the coefficients contain an intercept and a slope.
  if (length(coefficients) != 2 ||
      anyNA(coefficients)) {
    stop("coefficients must contain an intercept and a slope.")
  }
  
  # Extract the intercept and slope.
  a <- coefficients[1]
  b <- coefficients[2]
  
  # Calculate the estimated values.
  return(a + b * x)
}
