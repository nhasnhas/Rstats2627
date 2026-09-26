internal_check_fi_df <- function(fi_df, columns=NULL){
  # An internal function for checking if fi_df is a valid fi dataframe
  # if 'columns' is not null, checks if it contains the given columns
  
  # returns the fi_df or a n_fi_df if the input was a n_df

  cols <- colnames(fi_df)
  
  #check if it has the column fi
  if(!"fi" %in% cols){
    if(!"n" %in% cols){
      stop("input df does not have a n nor a fi column")
    } else {
      fi_df <- nana_n_fi_df_from_n_df(fi_df)
    }
  }
  
  cols <- colnames(fi_df)
  
  
  # Check if it contains the expected columns
  not_found_cols <- columns[!columns %in% cols]
  
  if(length(not_found_cols) != 0){
    not_found_cols_as_string <- paste(not_found_cols, collapse = ", ")
    cols_as_string <-paste(cols, collapse = ", ")
    
    stop(
      paste(c(
        "\nthe columns \"",
        not_found_cols_as_string,
        "\" were expected in the df, but not found.\n",
        
        "df columns: \"",
        cols_as_string,
        "\""
        ), collapse = ""))
  }
 
  return(fi_df)
}