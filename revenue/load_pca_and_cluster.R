
d<-loadData("C:\\test.csv")


load(file = "C:\\users\\stelios\\documents\\k_means.RData")



#biplot(comps)

d$comp1=predict(comps,d)[,1]
d$comp2=predict(comps,d)[,2]
#d$comp3=predict(comps,d)[,3]
#d$comp4=predict(comps,d)[,4]


library(clue)
d$cluster=cl_predict(k,d)
summary(as.factor(d$cluster))
#d$cluster=k$cluster



write.csv(d,"C:\\users\\stelios\\documents\\test_cluster.csv")
