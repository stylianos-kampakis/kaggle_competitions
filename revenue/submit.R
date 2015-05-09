
d<-loadData("C:\\test.csv")

df=data.frame(Id=seq(0,99999),Prediction=predict(gbmFit1,d))
write.csv(df,"C:\\users\\stelios\\documents\\test_submission.csv",quote=FALSE,row.names=FALSE)
