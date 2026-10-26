# Just a function that serves as a template to build your own bar/rectangle
# diagram, changing the variables as desired

nana_barplot_template <- function(c_data) {
  # 1.) Define the heights of the bars and their labels
  frequencies <- c_data
  categories <- c("Group A", "Group B", "Group C", "Group D") 
                                                    # one category for each 
                                                    # element of c_data
  # 2.) Generate the bar diagram
  barplot(height = frequencies, 
          names.arg = categories, 
          col = "steelblue",      # Color of the bars
          main = "Standard Bar Diagram", # Chart title
          xlab = "Categories",    # X-axis label
          ylab = "Frequency",     # Y-axis label
          space = 0.2)            # Space between bars (0.2 is the default)
}