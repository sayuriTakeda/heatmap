mat_data <- data.matrix(data[,2:ncol(data)])
mat_data %<>% round(2)

df_mat_data <- mat_data %>% 
  as.data.frame() %>% 
  rownames_to_column("CAT1") %>% 
  gather(CAT2, DIST, -CAT1)

ggplot(df_mat_data, aes(x = CAT1, y = CAT2, fill = DIST)) + 
    geom_tile() + 
    theme_minimal() +
    scale_fill_gradient(low = "green", high = "red")
