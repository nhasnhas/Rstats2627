nana_normal_eq_quadratic_fitting_y_equals_ax2_plus_bx_plus_c <- function(
    x,y) {
  M <- cbind(a = x*x, b = x, c = 1)
  Y <- matrix(y,ncol=1)
  A <- solve(t(M) %*% M) %*% t(M) %*% Y
  
  a=A[1]
  b=A[2]
  c=A[3]
  
  yasterisk = a * x*x + b * x +c
  
  err = y - yasterisk
  MSE = sum(err * err)/length(y)
  
  return(
    list(
      yasterisk = yasterisk,
      MSE = MSE,
      coefficients = list(
        a=a,
        b=b,
        c=c)
    )
  )
}