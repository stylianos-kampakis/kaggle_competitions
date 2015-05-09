d<-read.csv("C:\\train.csv")
d$Open.Date=as.Date(d$Open.Date,"%m/%d/%Y")
d$Open.Date=format(d$Open.Date,"%Y")
d$Open.Date=as.numeric(d$Open.Date)
d$Id=NULL
d$City<-NULL
d$City.Group<-NULL
d$Type<-NULL
d$revenue=log(d$revenue)

library(MASS)

fit=lm(revenue~.,d)
step <- stepAIC(fit, direction="both")
step$anova # display results



m1=lm(revenue~Open.Date*P2*P8*P9*P20*P24*P25*P26*P28,d)
step<-stepAIC(m1,direction="both")

h=summary(step)
h=coef(h)

formula="revenue~"

for(i in seq(2,nrow(h))){
  if(h[i,4]<0.01){
    formula=paste(formula,rownames(h)[i],"+")
  }
  
}

#remove the last '+'
formula=substr(formula,1,nchar(formula)-1)

m2=lm(as.formula(formula),d)
summary(m2)

library(epiR)

formula="revenue~ P20+P28+P2+P9+Open.Date+P20:P28 + Open.Date:P20:P28 + P2:P20:P28 + P9:P20:P28 + Open.Date:P2:P20:P28 + Open.Date:P9:P20:P28 + P2:P8:P9:P20:P28 + Open.Date:P2:P8:P9:P20:P28 "
predvalues=numeric(nrow(d))
for(i in seq(1,nrow(d))){
  train=d[-i,]
  test=d[i,]
  model=lm(as.formula(formula),train)
  res=predict(model,test)
  predvalues[i]=res
}

epi.ccc(d$revenue,predvalues)$rho.c
plot(predvalues,d$revenue)
sqrt(mean((exp(predvalues)-exp(d$revenue))^2))
