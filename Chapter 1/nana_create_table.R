nana_create_table <- function(c_data){
  # absolute frequency
  frequency <- table(c_data)
  
  # relative frequency
  relative_frequency <- frequency/ length(c_data)
  
  # cumulative frequency
  cumulative_frequency <- cumsum(frequency)
  
  # cumulative relative frequency
  cumulative_relative_frequency <- cumulative_frequency/ length(c_data)
  
  frequency_table <- data.frame(
    xi = as.numeric(names(frequency)),
    ni = as.numeric(frequency),
    fi = as.numeric(relative_frequency),
    Ni = as.numeric(cumulative_frequency),
    Fi = as.numeric(cumulative_relative_frequency)
  )
  
  # View(frequency_table) to get a visual way
  
  return(frequency_table)
}
