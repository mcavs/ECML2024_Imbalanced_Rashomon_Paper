balance <- function(data, method = "ros", IR = 1.25, seed = TRUE) {
  if(seed == TRUE){set.seed(123)}   
  if(method == "ros"){
    return(ROSE::ovun.sample(Class~., data = data, method = "over", p = (1 / (IR + 1)))$data)
  } else if (method == "rus"){
    return(ROSE::ovun.sample(Class~., data = data, method = "under", p = (1 / (IR + 1)))$data)
  } else if (method == "rose"){
    return(ROSE::ROSE(Class~., data = data, p = (1 / (IR + 1)))$data)
  } else if (method == "PDFOS"){
    return(imbalance::oversample(data = data, ratio = IR, classAttr = "Class", method = "PDFOS"))
  } else if (method == "RWO"){
    return(imbalance::oversample(data = data, ratio = IR, classAttr = "Class", method = "RWO"))
  } else if (method == "ANSMOTE"){
    return(imbalance::oversample(data = data, ratio = IR, classAttr = "Class", method = "ANSMOTE"))
  } else if (method == "SMOTE"){
    if(anyNA(data)){data <- na.omit(data)}
    return(themis::smote(data, "Class", over_ratio = (1 / IR)))
    #return(DMwR::SMOTE(Class ~ ., data = data))
    #return(imbalance::oversample(data = data, ratio = ratio, classAttr = "Class", method = "SMOTE"))
  } else if (method == "MWMOTE"){
    return(imbalance::oversample(data = data, ratio = IR, classAttr = "Class", method = "MWMOTE"))
  } else if (method == "BLSMOTE"){
    if(anyNA(data)){data <- na.omit(data)}
    return(themis::bsmote(data, "Class", over_ratio = IR, all_neighbors = TRUE))
  } else if (method == "DBSMOTE"){
    return(imbalance::oversample(data = data, ratio = IR, classAttr = "Class", method = "DBSMOTE"))
  } else if (method == "SLMOTE"){
    return(imbalance::oversample(data = data, ratio = IR, classAttr = "Class", method = "SLMOTE"))
  } else if (method == "RSLSMOTE"){
    return(imbalance::oversample(data = data, ratio = IR, classAttr = "Class", method = "RSLSMOTE"))
  } else if (method == "ADASYN"){
    if(anyNA(data)){data <- na.omit(data)}
    return(themis::adasyn(data, "Class", over_ratio = IR))
  } else if (method == "Near miss"){
    if(anyNA(data)){data <- na.omit(data)}
    return(themis::nearmiss(data, "Class", under_ratio = IR))
  } else if (method == "tomek"){
    if(anyNA(data)){data <- na.omit(data)}
    return(themis::tomek(data, "Class"))
  } else {  # original data
    return(data)
  }
}


