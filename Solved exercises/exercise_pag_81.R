source("https://github.com/nhasnhas/Rstats2627/releases/download/Latest/Rstats2627.R")

data <- nana_n_df_from_n_matrix("heightX","weightY",
                        c(55,65,75,85,95,105),
                        c(
                          155,
                          165,
                          175,
                          185,
                          195
                        ),
                        matrix(
                          c(
                            2,0 ,0,0,0,0,
                            4,4 ,0,0,0,0,
                            1,6 ,3,1,0,0,
                            0,1 ,4,1,1,0,
                            0,0 ,0,0,1,1
                            ), 
                          nrow=5,ncol=6, byrow = TRUE
                          )
                        )

# View(data)

cov <- nana_n_df_covariance(data, "heightX","weightY")
print(cov)

XslashY<-nana_n_df_linear_regression(data, "heightX","weightY")
YslashX<-nana_n_df_linear_regression(data, "weightY","heightX")


print(paste("R_X/Y: x =", XslashY["a"], "+ y *",XslashY["b"]))
print(paste("R_Y/X: y =", YslashX["a"], "+ x *",YslashX["b"]))

plot(data$heightX, data$weightY, cex=data$n)
abline(XslashY)

abline(
  a=-YslashX["a"]/YslashX["b"],
  b=1/YslashX["b"]
)