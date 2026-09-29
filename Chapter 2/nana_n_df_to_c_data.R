nana_n_df_to_c_data <- function(n_df, col_name){
  # converts the column 'col_name' (with the column n) to a c_data
  
  # visual example
  # if you have
  # X | n
  # -----
  # 7 | 2
  # 3 | 1
  # 7 | 1
  #
  # nana_n_df_to_c_data(my_df, "X")
  # converts it to
  # c(7,7,3,7)
  
  return(
    rep(n_df[[col_name]], n_df$n)
  )
}