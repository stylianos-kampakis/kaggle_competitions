loadData<-function(path){
  
  d<-read.csv(path)
  d$Open.Date=as.Date(d$Open.Date,"%m/%d/%Y")
  d$Open.Date=format(d$Open.Date,"%Y")
  d$Open.Date=as.numeric(d$Open.Date)
  
  date=d$Open.Date
  
  d$Open.Date<-NULL
  d$Id=NULL
  d$City<-NULL
  d$City.Group<-NULL
  d$Type<-NULL
  
  bin_cols=c(14:18,24:27,30:37)
  #d[,bin_cols]=apply(d[,bin_cols],2,function(x){ifelse(x>0,1,0)})
  d=d[,-c(15:18,24:27,30:37,23,13,10)]
  
  d$Open.Date=date
  return(d)
  
}