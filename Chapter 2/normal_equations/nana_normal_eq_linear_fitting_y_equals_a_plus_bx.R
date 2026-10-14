nana_normal_eq_linear_fitting_y_equals_a_plus_bx <- function(x,y){
  
  M <- cbind(a = 1, b = x)
  Y <- matrix(y,ncol=1)
  A <- solve(t(M) %*% M) %*% t(M) %*% Y
  
  a=A[1]
  b=A[2]
  
  yasterisk = a+b*x
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