nana_normal_eq_exponential_fitting_y_equals_ae_pow_bx <- function(
    x,y
) {
  lny=log(y)
  
  M <- cbind(lna = 1, b = x)
  Y <- matrix(lny,ncol=1)
  A <- solve(t(M) %*% M) %*% t(M) %*% Y
  
  a=exp(A[1])
  b=A[2]
  
  yasterisk = a * exp(b*x)
  err = y - yasterisk
  MSE = sum(err * err)/length(y)
  
  
  return(
    list(
      yasterisk = yasterisk,
      MSE = MSE,
      coefficients = list(
        a=a,
        b=b),
      R_squared = nana_coefficient_of_determination(y, MSE)
    )
  )
}