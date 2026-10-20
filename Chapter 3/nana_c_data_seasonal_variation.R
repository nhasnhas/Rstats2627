nana_c_data_seasonal_variation <- function(time_series, trend) {
  
  # time_series: get it by calling nana_c_data_time_series_to_time_series()
  # trend: get it by calling nana_c_data_trend_cycle()
  
  # SEASONAL VARIATION INDEX (E * A)
  # for: eliminating Trend cycle
  # for: obtaining the seasonal and random components by dividing
  # the observed series by the trend-cycle (X / TC)
  
  return (time_series / trend)
}