nana_plot_n_df_cols_and_linear_regression <- function(n_df, colX_name, colY_name) {
    # plots two df columns using its frequencies as the point sizes
  
    df <- internal_check_fi_df(n_df,c(colX_name,colY_name))
    
    X_values <- df[[colX_name]]
    Y_values <- df[[colY_name]]
    points_sizes <- df$fi * 15 # also possible df$n, or just 15
    
    plot(X_values, Y_values, cex = points_sizes,
         xlab = colX_name, ylab = colY_name, col = "navyblue") # optional but prettier
    
    coeff = nana_n_df_linear_regression(n_df, colX_name, colY_name)
    
    abline(coeff, col = "cornflowerblue") # also possible abline(coeff[1], coeff[2], col = "cornflowerblue")
}