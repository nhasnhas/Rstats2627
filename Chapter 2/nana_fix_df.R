nana_fix_df <- function(df, talk = TRUE) {
    if(talk) {print("hey, it's me, Dr. Data Frame, you can disable me talking by setting talk = FALSE in the arguments, as in nana_fix_df(df, talk = FALSE)")}




    # check it contains a column named n or fi
    n <- "n" %in% colnames(df)
    fi <- "fi" %in% colnames(df)
    
    if(talk & !n & !fi) {print("hey, looks like your df does not contain a 'n' column nor a 'fi' column, if that's on purpose, I guess its all right, otherwise you must fix it, because I dont know which values to put in there, you may put all n values to 1, or all fi values to 1/N, use rep and cbind to do that")}




    # sort the df by the first column
    df_pre <- df

    print("ordering the df by the first column, if it was already ordered, nothing will change")
    df <- df[order(df[[1]]),]

    if(talk & !identical(df_pre, df)) {print("hey, looks like your df was not ordered by the first column, I ordered it for you")}




    # check if the df has any rows with the same values in all columns except fi and n, if so, talk
    # Create a sub df without 'fi' and 'n'
    cols_to_check <- setdiff(names(df), c("fi", "n"))
    sub_df <- df[, cols_to_check, drop = FALSE]

    # Check if this sub df has any duplicate rows
    if (talk & any(duplicated(sub_df))) {
      print("hey, looks like your df has some rows with the same values in all columns except fi and n")
    }



    # check if the df has a column named fi, if not, create it and fill it with the n values divided by the sum of the n values
    if(n){
        print("hey, looks like your df has a column named n, I will create the fi column")
        df = internal_check_fi_df(df)
    }
}