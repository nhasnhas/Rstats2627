
nana_moment_of_order_r <- function(c_data, r, c) {
  # r = order of the moment (the exponent)
  # c = value we subtract from each data point
  # If c = mean(c_data), we get the central moment
  
  # Special formulas:
  # m_2 = standard_deviation^2 + mean(cdata)^2 
  # mu_3 <- m_3 - 3 * m_2 * mean(c_data) + 2 * mean(c_data)^3
  # mu_4 <- m_4 - 4 * m_3 * mean(c_data) + 6 * m_2 * mean(c_data)^2 - 3 * mean(c_data)^4

  # we find each different value and its frequency
  frequencies <- table(c_data)

  # we split them into numeric vectors with the values and their frequencies
  x <- as.numeric(names(frequencies))
  n <- as.numeric(frequencies)

  # we get the total number of elements
  N <- sum(n)

  # we calculate the moment of order r relative to c
  moment <- sum(n * (x - c)^r) / N

  return(moment)
}
