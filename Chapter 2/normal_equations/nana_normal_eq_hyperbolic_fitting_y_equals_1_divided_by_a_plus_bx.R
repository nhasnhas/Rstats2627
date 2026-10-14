nana_normal_eq_hyperbolic_fitting_y_equals_1_divided_by_a_plus_bx <- function(
    x,y) {
  one_divided_by_y=1/y
  
  M <- cbind(a = 1, b = x)
  Y <- matrix(one_divided_by_y,ncol=1)
  A <- solve(t(M) %*% M) %*% t(M) %*% Y
  
  a=A[1]
  b=A[2]
  
  yasterisk = 1/(a+b*x)
  err = y - yasterisk
  MSE = sum(err * err)/length(y)
  
  
  return(
    list(
      yasterisk = yasterisk,
      MSE = MSE,
      coefficients = list(
        a=a,
        b=b)
    )
  )
}
