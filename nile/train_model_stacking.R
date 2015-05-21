library(caretEnsemble)
#train$CodeSum=NULL nullify it because there are NAs in the testset

fitControl <- trainControl(## 10-fold CV
  method = "cv",number=10,summaryFunction = twoClassSummary,classProbs=TRUE)


models<-caretList(
  WnvPresent ~ .,
  train,
  methodList=c('LogitBoost','gbm','nb'),
  trControl=fitControl,
  tuneList=list(LogitBoost=caretModelSpec(method='LogitBoost',tuneGrid=expand.grid(nIter=c(81))),
                gbm=caretModelSpec(method='gbm',verbose=FALSE,tuneGrid=expand.grid(n.trees=c(150),interaction.depth=c(3),shrinkage=c(0.1)))
))

m1<-caretStack(models, method='gbm',trControl=fitControl)
# Start the clock!
print("predicting results on test set from stacking")
ptm <- proc.time()
res=predict(m1,test,type="prob")
print(proc.time() - ptm)

res=data.frame(id=seq(1,length(res$Yes)),WnvPresent=res$Yes)

write.csv(res,file.path(data_dir,"results.csv"),row.names=FALSE)

