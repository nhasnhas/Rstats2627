
nana_time_series_regression_line <- function(time_series, deseasonalized, start_year, frequency = 4) {
  
  # time_series: get it by calling nana_c_data_time_series_to_time_series()
  # deseasonalized: get it by calling nana_c_data_deseasonalized()
  
  # for: calculating the linear trend of the deseasonalized series
  # to study its long-term direction and estimate future values

  xx <- seq_along(time_series)
  
  # linear regression
  model <- lm(deseasonalized ~ xx)
  # Extract a and b
  a <- coef(model)[1]
  b <- coef(model)[2]
  
  # Calculate the predicted values of the line
  regL <- ts ( predict.lm( model ) , start = c (start_year , 1) , frequency = frequency)
  
  # Plot the deseasonalized sereis with the line
  lines(regL, col=2)
  
  # Return a and b in y = a + bx
  return(c(a = a, b = b))
}
