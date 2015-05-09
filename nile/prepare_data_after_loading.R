
train$WnvPresent=as.factor(train$WnvPresent)
library(plyr)
train$WnvPresent=revalue(train$WnvPresent,c("1"="Yes","0"="No"))

train$X=NULL
test$X=NULL
train$Block=as.factor(train$Block)
test$Block=as.factor(test$Block)

train$ResultDir=NULL
train$AvgSpeed=NULL
train$StnPressure=NULL
train$SeaLevel=NULL

levels(train$Species)=list(Dangerous=c("CULEX PIPIENS","CULEX PIPIENS/RESTUANS","CULEX RESTUANS"),
                           notDangerous=c("CULEX ERRATICUS","CULEX SALINARIUS","CULEX TARSALIS","CULEX TERRITANS"))