
d<-loadData("C:\\train.csv")

g=d
g$revenue=NULL
#d$revenue=log(d$revenue)

comps=prcomp(g)


d$comp1=comps$x[,1]
d$comp2=comps$x[,2]
#d$comp3=comps$x[,3]
#d$comp4=comps$x[,4]

#d=d[,39:43]

g=d
g$revenue=NULL

#d=data.frame(scale(d))

k=kmeans(g,4)


d$cluster=k$cluster


plot(d$cluster,d$revenue)

write.csv(d,"C:\\users\\stelios\\documents\\train_cluster.csv")
save(k,comps, file = "C:\\users\\stelios\\documents\\k_means.RData")
