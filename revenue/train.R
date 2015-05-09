

d<-loadData("C:\\train.csv")

library(caret)

fitControl <- trainControl(## 10-fold CV
  method = "cv",number=10)


#gbmGrid <-  expand.grid(neurons=c(6,7))
#gbmGrid <-  expand.grid(degree=c(1,2))
#gbmGrid<-expand.grid(mtry=c(10,30,50,100,150,200,400))
gbmGrid<-expand.grid(n.trees=c(50,100,150,200,250,300,350),interaction.depth=c(1,2,3,4),shrinkage=c(0.001,0.01,0.1,0.5))


gbmFit1 <- train( revenue~ ., data = d,
                 method ="gbm",
                 trControl = fitControl
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