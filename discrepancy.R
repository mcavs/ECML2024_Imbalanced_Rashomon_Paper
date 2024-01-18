discrepancy <- function(pred_reference, pred_rashomon) {
  # pred_reference: vector of the predicted classes of the reference/best model in the Rashomon set
  # pred_rashomon: data frame of predicted classes of the other models (except the reference models) in the Rashomon set
  
  conflicts <- colMeans(pred_rashomon != pred_reference)  # Calculate the conflicts for each model
  
  max(conflicts)
}
