nana_central_moment_of_order_r <- function(c_data, r) {
  
  # we find each different value and its frequency
  frequencies <- table(c_data)
  
  # we split them into numeric vectors with the names and the frequency corresponding to them
  x <- as.numeric(names(frequencies))
  n <- as.numeric(frequencies)
  
  # we get the total number of elements
  N <- sum(n)
  
  # with vectors we don't need a loop, R takes charge of going element by element in the vector
  moment <- sum(n * (x - mean(c_data))^r) / N
  
  return(moment)
}