nana_f_df_median <- function(f_dn, variable_of_median) {
  sum <- 0
  
  for (i in 1:length(f_dn$f)) {
    sum <- sum + f_dn$f[i]
    
    if (sum >= 0.5) {
      return(f_dn[[variable_of_median]][i])
    }
    
  }
}