nana_c_data_deseasonalized <- function(time_series, seasonal_indices_normalized) {
  
  # time_series: get it by calling nana_c_data_time_series_to_time_series()
  # seasonal_indices_normalized: get it by calling nana_c_data_seasonal_indices
  
  # for: removing seasonal variations from the original series to
  # compare periods without the influence of seasonality
  
  # to plot it:
  # plot ( time_series )
  # lines ( deseasonalized , col = "hotpink")
  
  return(time_series / seasonal_indices_normalized)
}