source("https://github.com/nhasnhas/Rstats2627/releases/download/Latest/Rstats2627.R")

df <- nana_n_df_from_n_matrix("X","Y",
                                c(0,1,2,3,4,5),
                                c(
                                  2,
                                  5,
                                  7,
                                  10
                                ),
                                matrix(
                                  c(
                                    3,3,1,0,0,0,
                                    3,4,2,0,0,0,
                                    1,3,2,1,0,0,
                                    0,1,1,2,3,2
                                  ), 
                                  nrow=4,ncol=6, byrow = TRUE
                                )
)



sub_df <- df[
  df$X >= 1 &
    df$X <=3
,]

plot(x=sub_df$X,y=sub_df$Y, cex=sub_df$n)

skewness <- nana_skewness_Fisher(nana_n_df_to_c_data(sub_df, "Y"))
print(skewness)

kurtosis <- nana_kurtosis(nana_n_df_to_c_data(sub_df, "Y"))
print(kurtosis)


#######################################################

XonY <- nana_n_df_linear_regression(df, "X", "Y")
YonX <- nana_n_df_linear_regression(df, "Y", "X")

print(paste("R_X/Y: x =", XonY["a"], "+ y *",XonY["b"]))
print(paste("R_Y/X: y =", YonX["a"], "+ x *",YonX["b"]))

abline(XonY)

abline(
  a=-YonX["a"]/YonX["b"],
  b=1/YonX["b"]
  )

###################################################

lcc <- nana_n_df_linear_correlation_coefficient(df, "X", "Y")

errors <- abs(
  (YonX["a"] + df$X * YonX["b"]) - df$Y
) * df$n

MSE <- sum(errors^2)/nana_n_df_N(df)

print(sqrt(MSE))
