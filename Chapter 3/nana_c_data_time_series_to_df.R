nana_c_data_time_series_to_df <- function(
  c_data,
  number_of_groups, # for months it would be = 12, for quarters of year, = 4
  year_of_start,
  month_or_quarter_of_start
) {
  ts(
    c_data,
    c(
      year_of_start,
      month_or_quarter_of_start),
    frequency = number_of_groups)
}