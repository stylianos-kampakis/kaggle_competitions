


final_data<-function(data_dir,dat,filter_distance=1){

weather=read.csv(file.path(data_dir, "weather.csv"))
spray=read.csv(file.path(data_dir, "spray.csv"))

dat$Date=as.Date(dat$Date)
weather=weather[weather$Station==1,]
weather$Date=as.Date(weather$Date,format="%m/%d/%Y")
spray$Date=as.Date(spray$Date)

#convert to numeric, write python script for cleanup of test dataset


library(sqldf)

# Haversine formula (hf)
hf <- function(long1, lat1, long2, lat2) {
  
  long1=long1*pi/180
  lat1=lat1*pi/180
  long2=long2*pi/180
  lat2=lat2*pi/180
  
  R <- 6371 # Earth mean radius [km]
  delta.long <- (long2 - long1)
  delta.lat <- (lat2 - lat1)
  a <- sin(delta.lat/2)^2 + cos(lat1) * cos(lat2) * sin(delta.long/2)^2
  c <- 2 * asin(sqrt(a))
  d = R * c
  return(d) # Distance in km
}

#create an id variable to identify each row
dat$id2=seq(1,nrow(dat))

joined=sqldf("SELECT dat.id2,dat.Longitude,dat.Latitude, spray.Latitude as sprayLatitude, spray.Longitude as sprayLongitude,
             (spray.Date-dat.Date) as time_dif 
             FROM spray LEFT JOIN dat WHERE time_dif==0")

#calculate the haversine distance
joined$distance=hf(joined$Longitude,joined$Latitude,joined$sprayLongitude,joined$sprayLatitude)
joined=joined[joined$distance<filter_distance,]


#for each row in the original, count how many times the same ID (that is all columns are equal) 
#appears in the joined table, and sum them. This is the number of effective sprays for that region

dat$numSprays=numeric(nrow(dat))

joined=joined[,c(1,7)]

dat$Longitude=NULL
dat$Latitude=NULL


for(i in 1:nrow(dat)){  
  dat[i,"numSprays"]=nrow(joined[joined$id2==i,])      
}

#variable removals

dat$id2=NULL
dat$AddressAccuracy=NULL
dat$Address=NULL
dat$Street=NULL
dat$AddressNumberAndStreet=NULL
dat$Block=as.factor(dat$Block)
dat$Longitude=NULL
dat$Latitude=NULL

dat$Trap=NULL

weather=weather[weather$Station==1,]
weather$Station=NULL
weather$Depth=NULL
weather$Water1=NULL
weather$SnowFall=NULL
#weather$CodeSum=NULL

dat_final=sqldf("SELECT dat.*,weather.* FROM dat LEFT OUTER JOIN weather ON weather.Date==dat.Date")


return(dat_final)
}

