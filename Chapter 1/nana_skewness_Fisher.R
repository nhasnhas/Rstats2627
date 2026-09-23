nana_skewness_Fisher <- function(c_data) {
  ## central moment of order 3
  r <- 3
  # we find each different value and its frequency
  frequencies <- table(c_data)
  
  # we split them into numeric vectors with the names and the frequency corresponding to them
  x <- as.numeric(names(frequencies))
  n <- as.numeric(frequencies)
  
  # we get the total number of elements
  N <- sum(n)
  
  # with vectors we don't need a loop, R takes charge of going element by element in the vector
  moment <- sum(n * (x - mean(c_data))^r) / N
  
  ## standard deviation
  standard_deviation <- sqrt(var(c_data)*(length(c_data)-1)/length(c_data))
  
  
  # Interpretation: 
  # result > 0 then right or positive skew 
  # result = 0 then symmetric
  # result < 0 then left or negative skew
  
  return(moment/(standard_deviation)^3)
}
