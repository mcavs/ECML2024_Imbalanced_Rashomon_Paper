library(DALEX)
library(ranger)
library(readr)
library(tidyverse)

VI_discrepancy <- function(object){
  hypothesis_space      <- object$hypothesis_space
  auc_scores            <- hypothesis_space$score_test$auc
  reference_model_index <- which.max(auc_scores)
  rashomon_models       <- which(auc_scores >= max(auc_scores) - 0.05)
  
  explainer_list  <- NULL
  model_VIs       <- NULL
  model_VIs_order <- NULL
  j <- 0
  for(i in rashomon_models){
    j <- j + 1
    model_name <- names(hypothesis_space$models_list)[i]
    data_name <- if (grepl("xgboost", model_name)) {
      "xgboost_data"
    } else if (grepl("ranger", model_name)) {
      "ranger_data"
    } else if (grepl("decision", model_name)) {
      "decision_tree_data"
    } else {
      "lightgbm_data"
    }
    model_input <- eval(parse(text = paste("hypothesis_space$models_list$", 
                                           model_name, sep = "")))
    data_input  <- eval(parse(text = paste("hypothesis_space$test_data$", 
                                           data_name, sep = "")))
    if (any(grepl("decision|ranger", model_name))){data_input <- data_input[, -ncol(data_input)]}
    explainer_list[[j]] <- DALEX::explain(model = model_input, 
                                          data = data_input, 
                                          y = hypothesis_space$test_observed,
                                          task = "classification",
                                          verbose = FALSE)
    model_VIs[[j]]        <- model_parts(explainer_list[[j]])
    model_VIs_order[[j]]  <- model_VIs[[j]]$variable[2:(dim(explainer_list[[j]]$data)[2] + 1)]}
  
  model_VIs_order_numeric <- mutate_all(data.frame(do.call(cbind, model_VIs_order)), 
                                        function(x) as.numeric(as.factor(x)))
  colnames(model_VIs_order_numeric) <- paste0("X", rashomon_models)
  
  similarity <- sapply(model_VIs_order_numeric[, -which(rashomon_models == reference_model_index), drop = FALSE], 
                       function(col) cor(model_VIs_order_numeric[ ,which(rashomon_models == reference_model_index)], 
                                         col, method = "kendall"))
  return(list(model_VIs_order = model_VIs_order_numeric, 
              fR = reference_model_index,
              Kendall = similarity))
}