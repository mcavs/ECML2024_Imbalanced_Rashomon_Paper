ambiguity <- function(pred_reference, pred_rashomon) {
  # pred_reference: vector of the predicted classes of the base model
  # pred_rashomon: data-frame of predicted classes of the models in the Rashomon set
  
  conflicts <- rowMeans(pred_reference != pred_rashomon)  # Calculate the conflicts for each row
  
  mean(conflicts)
}

