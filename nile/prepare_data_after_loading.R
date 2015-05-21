
train$WnvPresent=as.factor(train$WnvPresent)
library(plyr)
train$WnvPresent=revalue(train$WnvPresent,c("1"="Yes","0"="No"))
train$WnvPresent=revalue(train$WnvPresent,c("Yes"="1","No"="0"))


train$X=NULL
test$X=NULL
#train$NumMosquitos=NULL
train$Address=NULL
train$Street=NULL
train$AddressNumberAndStreet=NULL

test$NumMosquitos=5
test[test$Species=="UNSPECIFIED CULEX","Species"]=NA
test$Address=NULL
test$Street=NULL
test$AddressNumberAndStreet=NULL

library(lubridate)
train$month=month(train$Date)
test$month=month(test$Date)
train$Date=NULL
test$Date=NULL
#train$Date=as.factor(train$Date)
#test$Date=as.factor(test$Date)

#isws dn thelei factor chekare to
train$Block=as.numeric(train$Block)
test$Block=as.numeric(test$Block)
#train$Block=as.factor(train$Block)
#test$Block=as.factor(test$Block)

#train$ResultDir=NULL
#test$ResultDir=NULL
train$Date.1=NULL
test$Date.1=NULL
train$CodeSum=NULL
test$CodeSum=NULL
#train$ResultDir=NULL
#test$ResultDir=NULL
test$Id=NULL
#train$AvgSpeed=NULL
#train$StnPressure=NULL
#train$SeaLevel=NULL

wn=train$WnvPresent
train$WnvPresent=NULL
#train=data.frame(sapply(train,function(x) as.numeric(x)))
#test=data.frame(sapply(test,function(x) as.numeric(x)))
train$WnvPresent=wn
#levels(train$Species)=list(Dangerous=c("CULEX PIPIENS","CULEX PIPIENS/RESTUANS","CULEX RESTUANS"),  notDangerous=c("CULEX ERRATICUS","CULEX SALINARIUS","CULEX TARSALIS","CULEX TERRITANS"))