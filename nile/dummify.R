library(caret)
label=train$WnvPresent

train.d=train
train.d$WnvPresent=NULL

train.d=dummyVars(~.,train)
train.d=predict(train.d,train)
train.d[is.na(train.d)]=0
train=data.frame(train.d)

test.d=dummyVars(~.,test)
test.d=predict(test.d,test)
test.d[is.na(test.d)]=0
test=data.frame(test.d)

library(plyr)
label=revalue(label,c("Yes"="1","No"="-1"))
label=as.numeric(label)

library(xgboost)
dtrain <- xgb.DMatrix(as.matrix(train.d), label = label)

#g <- xgb.cv(data = dtrain, nround=10, nfold = 10, metrics=list("error"),"max.depth"=3, "eta"=0.05, "objective"="binary:logistic")
g <- xgboost(data = dtrain, nround=2000,metrics=list("auc"),"max.depth"=3, "eta"=0.000001, "objective"="binary:logistic")
pred=predict(g,as.matrix(test))

summary(pred)
