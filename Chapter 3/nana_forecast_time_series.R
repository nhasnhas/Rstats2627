nana_forecast_time_series <- function(
    time_series,
    seasonal_indices_normalized,
    years_ahead = 4,
    frequency = 4
) {
  
  # 1. Remove seasonality
  seasonal_factors <- seasonal_indices_normalized[cycle(time_series)]
  deseasonalized <- time_series / seasonal_factors
  
  # 2. Fit linear regression
  xx <- seq_along(time_series)
  model <- lm(as.numeric(deseasonalized) ~ xx)
  
  # 3. Create future time periods
  n_future <- years_ahead * frequency
  future_x <- length(time_series) + seq_len(n_future)
  
  # 4. Predict the future trend
  future_trend <- predict(
    model,
    newdata = data.frame(xx = future_x)
  )
  
  # 5. Get the last year and quarter as numeric values
  start_info <- start(time_series)
  start_year <- as.numeric(start_info[1])
  start_quarter <- as.numeric(start_info[2])
  
  last_position <- start_quarter - 1 + length(time_series)
  
  last_year <- start_year +
    (last_position - 1) %/% frequency
  
  last_quarter <- (last_position - 1) %% frequency + 1
  
  # 6. Calculate future years and quarters
  future_period <- last_quarter + seq_len(n_future)
  
  future_year <- last_year +
    (future_period - 1) %/% frequency
  
  future_quarter <- (future_period - 1) %% frequency + 1
  
  # 7. Reapply seasonality
  future_seasonal <- seasonal_indices_normalized[future_quarter]
  forecast <- as.numeric(future_trend) * future_seasonal
  
  # 8. Return the forecast as a quarterly time series
  forecast_ts <- ts(
    as.numeric(forecast),
    start = c(future_year[1], future_quarter[1]),
    frequency = frequency
  )
  
  return(forecast_ts)
}