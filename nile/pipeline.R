data_dir="C:/Users/stelios/Dropbox/Freelance/Kaggle/nile"


#best algorithms so far have been gbm and logitboost

algorithm="gbm"

#in the train dataset, the characters '-' and'M' have been replaced by NA and 'T' by 0


#use this variable to insert the names of columns to be removed hen running prepare_data
#there are some columns that have been pretty much confirmed to be useless and are removed
#in the additional preprocessing oncudcted by prepare_data_after_loading
columns_to_remove=c()

#train=read.csv(file.path(data_dir,"train_formatted.csv"))
#test=read.csv(file.path(data_dir,"test_formatted.csv"))


#prepares the data by reading the raw .csv files from kaggle. Ignores spray data.
source(file.path(data_dir,"prepare_data.R"))

#conducts some additional preprocessing that must be conducted (removal of some useless columns etc.)
source(file.path(data_dir,"prepare_data_after_loading.R"))
source(file.path(data_dir,"add_na_to_new_factorlevels.R"))


source(file.path(data_dir,"trainmodel.R"))

res=predict(gbmFit1,test,type="prob",na.action=NULL)
res=data.frame(id=seq(1,length(res$Yes)),WnvPresent=res$Yes)
#res=data.frame(id=seq(1,length(res)),WnvPresent=res)


write.csv(res,file.path(data_dir,"results.csv"),row.names=FALSE)
