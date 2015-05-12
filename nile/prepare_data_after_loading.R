
train$WnvPresent=as.factor(train$WnvPresent)
library(plyr)
train$WnvPresent=revalue(train$WnvPresent,c("1"="Yes","0"="No"))

train$X=NULL
test$X=NULL
train$NumMosquitos=NULL
train$Address=NULL
train$Street=NULL
train$AddressNumberAndStreet=NULL
test[test$Species=="UNSPECIFIED CULEX","Species"]=NA

library(lubridate)
train$Date=month(train$Date)
test$Date=month(test$Date)
train$Date=as.factor(train$Date)
test$Date=as.factor(test$Date)

#isws dn thelei factor chekare to

#train$Block=as.factor(train$Block)
#test$Block=as.factor(test$Block)

train$ResultDir=NULL
#train$AvgSpeed=NULL
#train$StnPressure=NULL
#train$SeaLevel=NULL

#levels(train$Species)=list(Dangerous=c("CULEX PIPIENS","CULEX PIPIENS/RESTUANS","CULEX RESTUANS"),  notDangerous=c("CULEX ERRATICUS","CULEX SALINARIUS","CULEX TARSALIS","CULEX TERRITANS"))