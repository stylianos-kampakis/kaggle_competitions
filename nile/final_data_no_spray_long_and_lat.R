


final_data<-function(data_dir,dat,filter_distance=1,col_remove=c("")){
  
  weather=read.csv(file.path(data_dir, "weather.csv"))
  if(!is.null(dat$Date)){
  dat$Date=as.Date(dat$Date)
  }
  weather=weather[weather$Station==1,]
  weather$Date=as.Date(weather$Date,format="%m/%d/%Y")
  
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
  
  
  #variable removals
  
  dat$AddressAccuracy=NULL
  #dat$Block=NULL
  #dat$Longitude=NULL
  #dat$Latitude=NULL
  
  dat$Trap=NULL
  
  
  
  weather=weather[weather$Station==1,]
  weather$Station=NULL
  weather$Depth=NULL
  weather$Water1=NULL
  weather$SnowFall=NULL
  #weather$CodeSum=NULL
  
  dat_final=sqldf("SELECT dat.*,weather.* FROM dat LEFT OUTER JOIN weather ON weather.Date==dat.Date")
  
  dat_final$Date=NULL
  
  return(dat_final)
}
