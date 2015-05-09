
train=read.csv(file.path(data_dir, "train.csv"))
test=read.csv(file.path(data_dir,"test.csv"))

#source(file.path(data_dir,'data_prepare_train.R'))
source(file.path(data_dir,'final_data_choose_cols.R'))

train=final_data(data_dir,train,1,columns_to_remove)
test=final_data(data_dir,test,1)

#test$numSprays=NULL



test[test$Species=="UNSPECIFIED CULEX","Species"]=NA



#write.csv(train,file.path(data_dir, "train_formatted_all_vars.csv"))
#write.csv(test,file.path(data_dir, "test_formatted_all_Vars.csv"))
