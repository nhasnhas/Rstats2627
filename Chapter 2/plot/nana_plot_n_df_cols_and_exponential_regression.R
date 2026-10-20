nana_plot_n_df_cols_and_exponential_regression <- function(n_df, colX_name, colY_name) {
    # plots two df columns using its frequencies as the point sizes and prints the exponential regresion curve
  
    df <- internal_check_fi_df(n_df,c(colX_name,colY_name))
    
    X_values <- df[[colX_name]]
    Y_values <- df[[colY_name]]
    points_sizes <- df$fi * 15 # also possible df$n, or just 15
    
    plot(X_values, Y_values, cex = points_sizes,
         xlab = colX_name, ylab = colY_name, col = "navyblue") # optional but prettier
    
    curveYpoints = nana_normal_eq_exponential_fitting_y_equals_ae_pow_bx(X_values, Y_values)[["yasterisk"]]
    
    lines(X_values, curveYpoints, col = "cornflowerblue")
}