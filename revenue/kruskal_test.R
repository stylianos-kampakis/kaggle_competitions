d<-read.csv("C:\\train.csv")
d$Open.Date=as.Date(d$Open.Date,"%m/%d/%Y")
d$Open.Date=format(d$Open.Date,"%Y")
d$Open.Date=as.numeric(d$Open.Date)
d$Id=NULL
d$City<-NULL
d$City.Group<-NULL
d$Type<-NULL

d$Open.Date<-NULL

#g=apply(d[,1:37],2,function(x){ifelse(x>0,1,0)})

for(i in 1:ncol(g)){
  result = tryCatch({
    
    print(wilcox.test(d$revenue~g[,i]))
    print(i)
    
  }, warning = function(w) {
    
  }, error = function(e) {
    
  }, finally = {
    
  })
}

kruskal.test(d[,c(14:18,24:27,30:37)])

kruskal.test(d[,c(22:23)])

kruskal.test(d[,c(12:13)])

kruskal.test(d[,c(9:10)])

