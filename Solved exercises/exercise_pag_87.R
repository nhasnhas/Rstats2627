


n_df <- data.frame(
  D=c(43,   55,   40,   52,   39,   33,   50,   33,   44,   21),
  V=c(27.0, 23.8, 30.7, 24.0, 34.8, 41.4, 27.0, 40.4, 31.7, 51.2),
  n=c(1,    1,    1,    1,    1,    1,    1,    1,    1,    1)
  
)

plot(n_df$D,n_df$V, cex=n_df$n)

DoverV = nana_n_df_linear_regression(n_df, "D", "V")
VoverD = nana_n_df_linear_regression(n_df, "V", "D")

r2 <- DoverV["b"] * VoverD["b"]

r <- sqrt(r2)

print(r)