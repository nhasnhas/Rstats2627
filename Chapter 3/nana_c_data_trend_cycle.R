nana_c_data_trend_cycle <- function(time_series, order = 4) {
  
  # time_series: get it by calling nana_c_data_time_series_to_time_series()
  
  # TREND (T)
  # trend = trend cycle
  # for: smoothing the values and eliminating seasonal and random
  # variations to observe the general direction of the series
  
  # to represent into a pretty table:
  # table <- cbind(period, X, trendinorder3,...)
  # colnames(table) <- c("p", "X", ....)
  # View(table)
  
  if (order < 1 || order != as.integer(order)) {
    stop("order must be a positive integer.")
  }
  
  if (order %% 2 == 1) {
    weights <- rep(1, order) / order
  } else {
    weights <- c(0.5, rep(1, order - 1), 0.5) / order
  }
  
  trend_cycle <- stats::filter(time_series, weights, sides = 2)
  
  return(trend_cycle)
  
}