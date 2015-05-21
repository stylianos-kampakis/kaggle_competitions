

library(caret)
split<-list(year1=c(1:3811),year2=c(3812:6060),year3=(6061:8114),year4=c(8115:10506))
fitControl <- trainControl(## 10-fold CV
  method = "cv",number=10,summaryFunction = twoClassSummary,classProbs=TRUE
  #,index=split
  )


#gbmGrid <-  expand.grid(neurons=c(6,7))
#gbmGrid <-  expand.grid(degree=c(1,2))
#gbmGrid<-expand.grid(mtry=c(10,30,50,100,150,200,400))
gbmGrid<-expand.grid(n.trees=c(3000),interaction.depth=c(4),shrinkage=c(0.0001))
#gbmGrid<-expand.grid(C=c(0.1,0.5,1,5,10,20,40))
#gbmGrid=expand.grid(nIter=c(31,41,51,61,71,81,100))

gbmFit1 <- train( WnvPresent~ ., data = train,
                  method =algorithm,
                  trControl = fitControl,metric="ROC",verbose=FALSE
                  ## This last option is actually one
                  ## for gbm() that passes through
                  #verbose = FALSE
                  ,tuneGrid=gbmGrid
)

gbmFit1

# 
# ctrl <- gafsControl(functions = caretGA)
# obj <- gafs(x = d[,1:39],
#             y = d[,40],
#             iters = 2,
#             gafsControl = ctrl,
#             ## Now pass options to `train`
#             
#             method = "lm")