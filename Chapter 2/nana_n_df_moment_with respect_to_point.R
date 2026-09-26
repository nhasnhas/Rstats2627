nana_fi_df_moment_of_order_rs_with_respect_to_point_ab <- function(fi_df, colX_name, colY_name, r, s, a, b) {
  
  df <- internal_check_fi_df(fi_df, c(colX_name,colY_name))
  
  return(
    sum(
      ((df[[colX_name]] - a) ^ r) *
      ((df[[colY_name]] - b) ^ s) *
      df$fi
    )
  )
  
}