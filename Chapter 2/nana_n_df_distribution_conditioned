nana_n_df_distribution_conditioned <- function(
    n_df,
    variable_name_conditionated_on,
    value_of_conditionated
) {
  conditioned <- n_df[
    n_df[[variable_name_conditionated_on]] == value_of_conditionated,
    ,
    drop = FALSE
  ]

  total <- sum(conditioned$n, na.rm = TRUE)

  if (nrow(conditioned) == 0 || total <= 0) {
    stop("No matching rows or total frequency is not positive.")
  }

  conditioned$f <- conditioned$n / total

  return(conditioned)
}