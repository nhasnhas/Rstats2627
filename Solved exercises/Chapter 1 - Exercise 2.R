source("https://github.com/nhasnhas/Rstats2627/releases/download/Latest/Rstats2627.R")

# CHAPTER 1 EXERCISE LIST --- EXERCISE 2
# ----------------------------------------------------------------------------
# We will sort the provided set of numbers:
X <- sort(c(5, 2, 4, 9, 5, 7, 4, 5, 6, 5, 7, 7, 5, 5, 2, 10, 5, 6, 5, 4,
            5, 8, 8, 4, 0, 8, 4, 8, 6, 6, 3, 6, 7, 6, 6, 7, 6, 7, 3, 5,
            6, 9, 6, 1, 4, 6, 3, 5, 5, 6, 7))
cat("\nX = {", paste(X, collapse = ", "), "}\n\n")

# -----o-----o-----o-----o-----o-----o-----o-----o-----
# 1.) TABLE OF FREQUENCIES

# Firstly, we will create the table of absolute and relative frequencies (both
# ordinary and cumulative).

# For that, we must define the cardinality of our vector of grades X:
N <- length(X)

# Done that, we can now start setting up the table, converting X into a
# data frame. That way, we will obtain the ABSOLUTE FREQUENCY:
freq_table_X <- as.data.frame(table(X))

# We rename the columns:
colnames(freq_table_X) <- c("x_i", "n_i")

# Now, we will obtain the RELATIVE FREQUENCY by dividing the absolute
# frequencies table by the cardinality of vector X, N:
freq_table_X$f_i <- round(freq_table_X$n_i/N, digits = 4)

# We calculate the cumulative absolute and relative frequencies, on that
# respective order:
freq_table_X$N_i <- cumsum(freq_table_X$n_i)
freq_table_X$F_i <- cumsum(freq_table_X$f_i)

# Finally, we print the table:
print(freq_table_X)

# -----o-----o-----o-----o-----o-----o-----o-----o-----
# 2.) BAR CHART GENERATION

# We use the barplot() function, setting the bar heights to the relative
# frequencies (f_i) and labeling the x-axis with the corresponding unique
# grades (x_i):
barplot(height = freq_table_X$f_i, 
        names.arg = freq_table_X$x_i, 
        main = "Relative Frequencies of Student Grades", 
        xlab = "Grades", 
        ylab = "Relative Frequency", 
        col = "lightpink")

