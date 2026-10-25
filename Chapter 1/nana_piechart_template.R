source("https://github.com/nhasnhas/Rstats2627/releases/download/Latest/Rstats2627.R")

# Just a function that serves as a template to build your own pie chart,
# changing the variables as desired

nana_piechart_template <- function() {
  # 1.) Define the numerical values and their corresponding labels
  frequencies <- c(15, 30, 45, 10)
  categories <- c("Group A", "Group B", "Group C", "Group D")
  
  # 2.) Generate the pie chart
  pie(x = frequencies, 
      labels = categories, 
      
      # Colors for each slice
      col = c("lightblue", "lightgreen", "lightpink", "lightyellow"), 
      main = "Standard Pie Chart") # Chart title
}