discrepancy <- function(pred_reference, pred_rashomon) {
  # pred_reference: vector of the predicted classes of the base model
  # pred_rashomon: data-frame of predicted classes of the models in the Rashomon set
  
  conflicts <- colMeans(pred_rashomon != pred_reference)  # Calculate the conflicts for each column
  
  max(conflicts)
}