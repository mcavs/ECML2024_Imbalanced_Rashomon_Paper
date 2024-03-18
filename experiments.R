for(i in 1:length(datasets)){
  id   <- i
  data <- datasets[[id]]
  for(j in c(1, 1.05, 1.1, 1.15, 1.2, 1.25){
    IR <- j
    results <- list()

    # balancing the datasets using random oversamplin (ROS), random undersampling (RUS), Near miss, and SMOTE
    data_ros <- balance(data, method = "ros")
    data_rus <- balance(data, method = "rus")
    data_nea <- balance(data, method = "Near miss")
    data_smo <- balance(data, method = "SMOTE")

    # creating the Rashomon sets for balanced datasets
    org      <- rashomon_set(data)
    ros      <- rashomon_set(data_ros)
    rus      <- rashomon_set(data_rus)
    nea      <- rashomon_set(data_nea)
    smo      <- rashomon_set(data_smo)
    
    results <- list(org, ros, rus, nea, smo)
    write_rds(results, paste0("experiment_data", id, "_ir", IR, ".rds"))
    }
}






