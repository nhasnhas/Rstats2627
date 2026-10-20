nana_c_data_comb <- function(c_data, k){
  # returns a table with the combinations that can be done with 
  # the c_data elements in k groups
  
  t(combn(c_data,k))
}
