balance <- function(data, method = "ros", resr = 1.25, seed = TRUE) {
  # resr: resampling ratio (the number of observations in the majority class / the number of observations in the majority class)
  # seed: logical operator that controls the reproducibility
  if(seed == TRUE){set.seed(123)}   
  if(method == "ros"){
    # random oversampling
    return(ROSE::ovun.sample(Class~., data = data, method = "over", p = (1 / (resr + 1)))$data)
  } else if (method == "rus"){
    # random undersampling
    return(ROSE::ovun.sample(Class~., data = data, method = "under", p = (1 / (resr + 1)))$data)
  } else if (method == "SMOTE"){
    # Synthetic Minority Oversampling Technique
    if(anyNA(data)){data <- na.omit(data)}
    return(themis::smote(data, "Class", over_ratio = (1 / resr)))
  } else if (method == "Near miss"){
    # Near miss
    if(anyNA(data)){data <- na.omit(data)}
    return(themis::nearmiss(data, "Class", under_ratio = resr))
  } else {  
    # original data
    return(data)
  }
}


