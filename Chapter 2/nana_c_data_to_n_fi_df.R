nana_c_data_to_n_fi_df <- function(c_data, col_name = "X"){
  xi <- unique(c_data)
  ni <- c()
  for (x in xi) {
    ni = c(ni,length(c_data[c_data == x]))
  }
  
  N <- sum(ni)
  fi <- ni/N
  df <- data.frame(X = xi,n = ni, fi = fi)
  
  colnames(df) <- c(col_name,"n","fi")
  
  return(df)
}