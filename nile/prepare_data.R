library(missForest)
train=read.csv(file.path(data_dir, "train.csv"))
test=read.csv(file.path(data_dir,"test.csv"))

#source(file.path(data_dir,'data_prepare_train.R'))
source(file.path(data_dir,'final_data_no_spray.R'))

train=final_data(data_dir,train,1)
test=final_data(data_dir,test,1)
#g=missForest(test)
#test=g$ximp
#test$numSprays=NULL



#write.csv(train,file.path(data_dir, "train_formatted_all_vars.csv"))
#write.csv(test,file.path(data_dir, "test_formatted_all_Vars.csv"))
