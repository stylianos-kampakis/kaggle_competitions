makeClusters<-function(train,test,numClusters=2){

train2=train[,c('WnvPresent',"Latitude","Longitude")]
train2=train2[train2$WnvPresent=="Yes",]

train2$WnvPresent=NULL
centers=kmeans(train2,numClusters)$centers


hf <- function(long1, lat1, long2, lat2) {
  
  long1=long1*pi/180
  lat1=lat1*pi/180
  long2=long2*pi/180
  lat2=lat2*pi/180
  
  R <- 6371 # Earth mean radius [km]
  delta.long <- (long2 - long1)
  delta.lat <- (lat2 - lat1)
  a <- sin(delta.lat/2)^2 + cos(lat1) * cos(lat2) * sin(delta.long/2)^2
  c <- 2 * asin(sqrt(a))
  d = R * c
  return(d) # Distance in km
}

centers=as.data.frame(centers)

for(i in 1:numClusters){
  train[[ncol(train)+1]]=hf(train$Longitude,train$Latitude,centers$Longitude[i],centers$Latitude[i])
  test[,names(train)[length(train)]]=hf(test$Longitude,test$Latitude,centers$Longitude[i],centers$Latitude[i])
}

result=list(train=train,test=test,centers=centers)
return(result)
}