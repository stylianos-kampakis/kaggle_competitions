for(name in names(train)){
  if(is.factor(train[,name]) && name %in% colnames(test)){
    print(name)
  A_factors=as.character(train[,name])
  B_factors=as.character(test[,name])
  
  newvalues=sapply(B_factors,function(x) if (x %in% A_factors) x else NA)
  
  test[,name]=as.factor(newvalues)
  
  #train[,name]=as.factor(A_factors)
  
  #levels(test[,name])=levels(train[,name])
  }
  
}