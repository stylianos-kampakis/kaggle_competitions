#prepare data and add clustering information
data_dir="C:/Users/stelios/Dropbox/Freelance/Kaggle/nile"

train=read.csv(file.path(data_dir, "train.csv"))
test=read.csv(file.path(data_dir,"test.csv"))

#source(file.path(data_dir,'data_prepare_train.R'))
source(file.path(data_dir,'final_data_no_spray_long_and_lat.R'))

train=final_data(data_dir,train,1,columns_to_remove)
test=final_data(data_dir,test,1)
source(file.path(data_dir,"prepare_data_after_loading.R"))

source(file.path(data_dir,'clustering.R'))

dat=makeClusters(train,test,2)

train=dat$train
test=dat$test

source(file.path(data_dir,'train_model_stacking.R'))
