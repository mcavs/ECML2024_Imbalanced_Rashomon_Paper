rashomon_set <- function(dataset, epsilon = 0.05, seed = TRUE) {
  # epsilon: Rashomon parameter [0, 1]
  # seed: 
  
  # AutoML with forester
  if(seed == TRUE){set.seed(123)}   
  trained_models <- forester::train(data         = dataset,
                                    y            = 'Class', 
                                    bayes_iter   = 5,
                                    random_evals = 10,
                                    verbose      = FALSE)
  
  calculate_bal_accuracy <- function(predictions, observed) {
    bal_accuracy_vec(
      truth = factor(observed, levels = c(0, 1)),
      estimate = factor(predictions, levels = c(0, 1)),
      estimator = "binary",
      event_level = "second")}
  
  calculate_specificity <- function(predictions, observed) {
    specificity_vec(
      truth = factor(observed, levels = c(0, 1)),
      estimate = factor(predictions, levels = c(0, 1)),
      estimator = "binary",
      event_level = "second")}
  
  bacc <- lapply(trained_models$predictions_test_labels, 
                 function(predictions) {calculate_bal_accuracy(predictions, 
                                        trained_models$test_observed)})
  
  spec <- lapply(trained_models$predictions_test_labels, 
                 function(predictions) {calculate_specificity(predictions, 
                                        trained_models$test_observed)})
  
  trained_models$score_test <- cbind(trained_models$score_test, 
                                     bacc = as.numeric(bacc),
                                     spec = as.numeric(spec))
  
  # extract AUC scores of the trained models
  auc_scores <- trained_models$score_test$auc
  
  # Find the index of the base/best model
  reference_model_index <- which.max(auc_scores)
  
  # Extract predictions of the best model
  pred_reference <- trained_models$predictions_test_labels[[reference_model_index]]
  
  # Find models in the Rashomon set based on epsilon
  rashomon_models <- which(auc_scores >= max(auc_scores) - epsilon)
  
  # Extract predictions of models in the Rashomon set
  pred_rashomon <- do.call(cbind, trained_models$predictions_test_labels[rashomon_models])
  
  list(imbalanced_ratio = max(table(dataset$Class)) / min(table(dataset$Class)),
       rashomon_set_size = ncol(pred_rashomon),
       ambiguity = ambiguity(pred_reference, pred_rashomon), 
       discrepancy = discrepancy(pred_reference, pred_rashomon), 
       rashomon_set_auc = trained_models$score_test$auc[rashomon_models], 
       rashomon_set_f1 = trained_models$score_test$f1[rashomon_models],
       rashomon_set_bacc = trained_models$score_test$bacc[rashomon_models],
       rashomon_set_spec = trained_models$score_test$spec[rashomon_models])
       hypothesis_space = trained_models)
}





