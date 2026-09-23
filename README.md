# Rstats2627

R functions for the 2026-2027 Statistical Methods course

## Quick start

Source the releases R file with `source(...)`

```R
source("https://github.com/nhasnhas/Rstats2627/releases/download/Latest/Rstats2627.R")
```

### Example

```R
source("https://github.com/nhasnhas/Rstats2627/releases/download/Latest/Rstats2627.R")

data <- c_data(1,2,3)

standard_deviation(data)
```

## Small tutorials

This section covers small tutorials for some R features and syntaxt needed to operate with this repository functions

### Operating with dataframes `df`

#### Creating a dataframe

1. Imagine you want to create a X and Y dataframe for this data

```json
{
    (1,1),
    (1,4),
    (2,4),
    (2,4)
}
```

2. You may think of it as

Y vs X | 1 | 2 |
-------|---|---|
**1**  | 1 | 0 |
**4**  | 1 | 2 |

3. But for R, we will be using dataframes, that stores it as

X | Y | n |
--|---|---|
1 | 1 | 1 |
1 | 4 | 1 |
2 | 4 | 2 |

4. Lets see how to write that in R

```R
n_df <- data.frame(
    X=c(1,1,2),
    Y=c(1,4,4),
    n=c(1,1,2)
)
```

Observe how each variable is just the column as a `c()` from top to botom

Here the variables are **X** and **Y**, but they could have another name/be named in a different way  
For example, if the data were **age vs height**:

```R
n_df <- data.frame(
    Age=c(1,1,2),
    Height=c(1,4,4),
    n=c(1,1,2)
)
```

Well, I guess that babies that are 4 meters tall are not common, but you get the idea...

#### Accesing the dataframe

Theres multiple ways to do the same thing, so we will check each operation and its equivalences using the previous table as a reference

```R
n_df <- data.frame(
    Age=c(1,1,2),
    Height=c(1,4,4),
    n=c(1,1,2)
)
```

when printed in R:
```R
  Age Height n
1   1      1 1
2   1      4 1
3   2      4 2
```

###### Get a column as a dataframe

If, for example, we are interested in just the second column, Height, we can do
```R
n_df["Height"]

# or

n_df[2]
```

returning
```R
  Height  
1      1  
2      4  
3      4  
```

###### Get a column as a list (`c()`)

If we are interested in a column **actual data** (and not a sub dataframe) we can do any of
```R
# using double brackets
n_df[["Height"]] 
n_df[[2]]

# using $
n_df$Height 
```

returning

```R
[1] 1 4 4
```

###### Filtering data frame
If we are interested only in certain rows of the dataframe, we may operate using the brackets as seen in the[**Get a column as a dataframe**](#get-a-column-as-a-dataframe) section, where we filtered by column name

The usual sintax is `df[df$column_to_filter_on operation number ,]`

Some examples
```R
# df of babies whose Height is 1
n_df[n_df$Height == 1,]

# number of babies whose Height is 1
sum(
    n_df[n_df$Height == 1,]$n
)

# number of babies whose Height is > 1
sum(
    n_df[n_df$Height > 1,]$n
)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# df of babies whose Age is 2 and Height 4
n_df[n_df$Age==2,][n_df[n_df$Age==2,]$Height==4,]
# note this would be wrong
n_df[n_df$Age==2,][n_df$Height==4,]
# the reason:
# in the second filter, we are filtering over n_df[n_df$Age==2,], not n_df

# a cleaner way to see this and build filters
df_age_is_two <- n_df[n_df$Age==2,]

df_age_is_two_and_height_4 <- df_age_is_two[df_age_is_two$Height == 4,]
```
