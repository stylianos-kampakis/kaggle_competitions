library(caretEnsemble)


fitControl <- trainControl(## 10-fold CV
  method = "cv",number=10,summaryFunction = twoClassSummary,classProbs=TRUE)


gbmFit1

models<-caretList(
  WnvPresent ~ .,
  train,
  methodList=c('LogitBoost','gbm','nb'),
  trControl=fitControl,
  tuneList=list(LogitBoost=caretModelSpec(method='LogitBoost',tuneGrid=expand.grid(nIter=c(81))),
                gbm=caretModelSpec(method='gbm',tuneGrid=expand.grid(n.trees=c(150),interaction.depth=c(3),shrinkage=c(0.1)))
))

m1<-caretStack(models, method='glm',trControl=fitControl)
# Start the clock!
ptm <- proc.time()
res=predict(m1,test,type="prob")
proc.time() - ptm

res=data.frame(id=seq(1,length(res$Yes)),WnvPresent=res$Yes)

write.csv(res,file.path(data_dir,"results.csv"),row.names=FALSE)

