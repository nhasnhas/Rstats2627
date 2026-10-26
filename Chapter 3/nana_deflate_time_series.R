nana_deflate_time_series <- function(nominal_values, price_index) {
  # Deflates nominal values using price indices expressed as ratios.
  # For example, a CPI of 135% must be supplied as 1.35.
  # Check that the nominal values and price indices are numeric.
  if (!is.numeric(nominal_values) || !is.numeric(price_index)) {
    stop("nominal_values and price_index must be numeric.")
  }
  
  # Check that the price indices are not zero.
  if (any(price_index == 0, na.rm = TRUE)) {
    stop("price_index must not contain zero.")
  }
  
  # Allow a single price index or one index per nominal value.
  if (length(price_index) != 1 &&
      length(price_index) != length(nominal_values)) {
    stop("price_index must have length 1 or match nominal_values.")
  }
  
  # Divide nominal values by the corresponding price indices.
  return(nominal_values / price_index)
}