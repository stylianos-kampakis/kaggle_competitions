

library(caret)

fitControl <- trainControl(## 10-fold CV
  method = "cv",number=10,summaryFunction = twoClassSummary,classProbs=TRUE)


#gbmGrid <-  expand.grid(neurons=c(6,7))
#gbmGrid <-  expand.grid(degree=c(1,2))
#gbmGrid<-expand.grid(mtry=c(10,30,50,100,150,200,400))
#gbmGrid<-expand.grid(n.trees=c(50,100,150,200,250,300),interaction.depth=c(2),shrinkage=c(0.001,0.01,0.1,0.2,0.3,0.4))
#gbmGrid<-expand.grid(C=c(0.1,0.5,1,5,10,20,40))
#gbmGrid=expand.grid(nIter=c(31,41,51,61,71,81,100))

gbmFit1 <- train( WnvPresent~ ., data = train,
                  method =algorithm,
                  trControl = fitControl,metric="ROC"
                  ## This last option is actually one
                  ## for gbm() that passes through
                  #verbose = FALSE
                  #,tuneGrid=gbmGrid
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