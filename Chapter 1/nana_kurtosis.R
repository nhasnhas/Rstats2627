nana_kurtosis <- function(c_data){
  ## central moment of order 4
  r <- 4
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
  # result > 0 then more peaked than normal (Leptokurtic)
  # result = 0 then same peakedness as the normal (Mesokurtic)
  # result < 0 then less peaked than the normal (Platykurtic)
  
  return((moment/(standard_deviation)^4) - 3)
}
