nana_n_df_ordinary_moment <- function(fi_df, colX_name, colY_name, r, s) {
  
  df <- internal_check_fi_df(fi_df, c(colX_name, colY_name))
  
  return(
    nana_fi_df_moment_of_order_rs_with_respect_to_point_ab(
      df,
      colX_name, colY_name,
      r, s,
      0, 0
    )
  )
}
