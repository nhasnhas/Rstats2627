source("https://github.com/nhasnhas/Rstats2627/releases/download/Latest/Rstats2627.R")

# Function to calculate the affine transformation:
# Y = a + (b * X); that is, y_i = a + (b * x_i).
# Therefore: mean_y = a + (mean_x * b)

nana_affine_transformation <- function(x, a, b) {
  # Applies the affine transformation formula: y = a * x + b
  # x: The input vector (e.g., a column of raw data or midpoints x_i)
  # a: The constant added to shift the data (intercept)
  # b: The scalar multiplied to stretch or shrink the data (slope)
  
  y <- a + (b * x)
  return(y)
}