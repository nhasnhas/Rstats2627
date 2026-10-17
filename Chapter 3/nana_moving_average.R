# Calculates the moving average of a time series for a given order.
nana_moving_average <- function(c_data, order) {
  # Create the weights for the moving average.
  weights <- rep(1, order)
  
  # For even orders, use half-weights at both ends
  # to center the moving average between observations.
  if (order %% 2 == 0) {
    weights <- rep(1, order + 1)
    weights[1] <- 0.5
    weights[order + 1] <- 0.5
  }
  
  # Normalize the weights so that they sum to 1.
  weights <- weights / order
  
  # Calculate and return the moving average.
  stats::filter(c_data, filter = weights, sides = 2)
}