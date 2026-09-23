nana_df_from_n_matrix <- function(Xname, Yname,header_row, header_col, n_matrix){
  df<- data.frame(X=c(),Y=c(),n=c()) # init empty data frame
  
  # for each cell of the matrix, bind it to the dataframe (as a row, row bind, rbind())
  for(row in 1:nrow(n_matrix)){
    for(col in 1:ncol(n_matrix)){
      df<- rbind(
        df,
        c(
          header_row[col],
          header_col[row],
          n_matrix[row,col]
          )
        )
    }
  }
  
  colnames(df) <- c(Xname, Yname, "n") # change dataframe column names to given
  
  return(df)
}

# Code example (select and uncomment with Ctrl + Shift + C for testing it)

# View(df_from_n_matrix("age in years", "heigh in cm",
#                       c(1,12,30,90),
#                  c(
#                    50,
#                    75,
#                    100,
#                    150,
#                    200
#                  ),
#                  matrix(
#                    c(
#                      21,2,1,0,
#                      19,6,2,1,
#                      0,17,11,7,
#                      0,6,31,16,
#                      0,2,9,2
#                    ), ncol = 4, byrow = TRUE
#                  )))
