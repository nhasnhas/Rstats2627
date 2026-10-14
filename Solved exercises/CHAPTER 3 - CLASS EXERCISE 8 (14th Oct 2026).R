source("https://github.com/nhasnhas/Rstats2627/releases/download/Latest/Rstats2627.R")

# CHAPTER 3 - CLASS EXERCISE 8, PAGE 71
# ----------------------------------------------------------------------------
library(tidyverse)
library(rlang)

# Given data: CPI for 1998 with respect to 1990 is 135%. That is, the consumer
# price index for 1998 has grown by 135% with respect to 1990:
cpi_1990 <- 100
cpi_1998 <- 135
cpi <- cpi_1998 / cpi_1990

# ############################### SECTION 1.) ###############################
nominal_value_1998 <- 1000
real_value_1990 <- nominal_value_1998 / cpi

cat("\n1.) Real value in 1990:", round(real_value_1990, 2), "pesetas\n")


# ############################### SECTION 2.) ###############################
nominal_value_1990 <- 1000
real_value_1998 <- nominal_value_1990 * cpi

cat("2.) Real value in 1998:", real_value_1998, "pesetas\n")