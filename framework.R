data_dir="C:/Users/stelios/Dropbox/Freelance/Kaggle/nile"

#train_model parameters
algorithms=c("gbm","glm","rf","xgboost")
number_of_folds=10
grid=c()
metric="ROC"

#feature_selection parameters

#common choices here can be chi-square, or info_gain, for example
#feature selection is always conducted first using the train set and then the results are then carried over
#to the test set. So, for example, if you use chi-square attribute evaluation, the evaluation will be conducted
#on the training set and any features that are removed will be removed from both datasets.
feature_selection_procedure="removal"
feature_selection_args=list(columns_to_remove=c())

#example choices are 'pca','cluster', etc.
preprocess_procedure="none"
preprocess_args=list(argument1=c(),argument2=c())

#Load_data loads the raw datafiles, and runs any necessary manipulations in order to end up with a 
#single dataframe for train and one dataframe for test.

#Load_data expects that all files are in the folder specified by data_dir.
#Load_data should not perform any unecessary manipulations, such as removing columns, which should be performed
#by preprocess.
source(file.path(data_dir,"load_data.R"))


#Load_data loads the raw datafiles, and runs any necessary manipulations in order to end up with a 
#single dataframe for train and one dataframe for test.
source(file.path(data_dir,"feature_selection.R"))


#Preprocess is a function which accepts two arguments, the preprocess_id and the preprocess_args.
#The preprocess_id determines which kind of preprocessing is conducted. The id="none" always corresponds to 
#returning the dataset itself. Other options can include, for example, pca or clustering through k-means
source(file.path(data_dir,"preprocess.R"))


source(file.path(data_dir,"train_model.R"))
source(file.path(data_dir,"predict_submit.R"))
