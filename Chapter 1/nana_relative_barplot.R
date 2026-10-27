nana_relative_barplot <- function(c_data) {
  # Create the frequency table
  frequency_table <- nana_create_table(c_data)
  
  # Relative frequencies and categories
  frequencies <- frequency_table$fi
  categories <- frequency_table$xi
  
  # Generate the bar chart
  barplot(
    height = frequencies,
    names.arg = categories,
    col = "steelblue",
    main = "Relative Frequency Bar Chart",
    xlab = "xlab",
    ylab = "Relative Frequency",
    space = 0.2
  )
}