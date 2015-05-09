table(train$Species,train$WnvPresent)

#merge 3 species together
##########


aggregate(.~WnvPresent,data=train,FUN=mean)
aggregate(.~WnvPresent,data=train,FUN=sd)

train$ResultDir=NULL
train$AvgSpeed=NULL
train$StnPressure=NULL
train$SeaLevel=NULL


nums <- sapply(train, is.numeric)
nums=train[,nums]

nums=nums[complete.cases(nums),]

corrplot(cor(nums))
