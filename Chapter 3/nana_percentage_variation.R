nana_percentage_variation <- function(initial_value, final_value) {
  # Calculates the percentage variation between an initial and a final value.
  # Check that the input values are numeric.
  if (!is.numeric(initial_value) || !is.numeric(final_value)) {
    stop("initial_value and final_value must be numeric.")
  }
  
  # Check that the initial value is not zero.
  if (any(initial_value == 0, na.rm = TRUE)) {
    stop("initial_value must not contain zero.")
  }
  
  # Calculate the percentage variation.
  return((final_value / initial_value - 1) * 100)
}