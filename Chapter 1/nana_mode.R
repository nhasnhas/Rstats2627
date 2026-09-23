nana_mode <- function(c_data) {
  # returns a c_data with the mode or modes
  
  # we find the different values that exist in c_data frequencies of each value in c_table
  # table() → groups equal values → counts them → stores the counts as a vector → gives each count the original value as its name
  frequencies <- table(c_data)
  
  # we extract the highest frequencies
  max_frequency <- max(frequencies)
  
  # we create vector modes, that holds the numeric type of the names of the elements 
  #corresponding to the highest frequencies
  modes <- as.numeric(names(frequencies[frequencies == max_frequency]))
  
  return(modes)
}