na_interpolate<-function(data_frame){
  if(is.vector(data_frame)==FALSE){
# define wheather the import data type can be run as
# vector or data frame
  data <- data_frame
# get the copy of the data frame import to progress later
  for(i in 1:nrow(data)){
    for(j in 1:ncol(data)){
# limit the scan in the data frame
      if(is.na(data[i,j]) == TRUE){
# for the entry in the data frame as NA to process the operation
         n<-1
         while(i-n >= 1 && is.na(data[i-n,j]) == TRUE){
           n<-n+1
         }
# count the distance  from the NA entry to the front entry 
         if(i-n >= 1){
           if(is.na(data[i-n,j]) == FALSE){
             before <- data[i-n,j]
           }
           else{
             n <- 0
           }
         }
         else{
           n<-0
         }
# operation to the non-NA entry before NA entry
# for if the entry is not in the frame or the entry is actually a number 
         m<-1
         while(i+m <= nrow(data) && is.na(data[i+m,j]) == TRUE){
            m<-m+1
         }
# count the distance  from the NA entry to the after entry 
         if(i+m <= nrow(data)){
           if(is.na(data[i+m,j]) == FALSE){
             after <- data[i+m,j]
           }
           else{
             m <- 0
           }
         }
         else{
           m<-0
         }
# operation to the non-NA entry after NA entry
# for if the entry is not in the frame or the entry is actually a number 
         if(n != 0){
           if(m != 0){
           c <- (n*after+m*before)/(n+m)
           data[i,j] <- c
           }
           else{
             data[i,j] <- before
           }
           }
          else if(m != 0){
            data[i,j] <- after
          }
# replace the original data(NA) to the new data from the formula
# or replace NA with the only found before/after data
         }
      }
    }
  }
  else{
    data<-data_frame
# copy the vector to a same length vector
    for(i in 1:length(data)){
# limit the scan in the vector frame
      if(is.na(data[i])==TRUE){
# for the entry in the data frame as NA to process the operation
        n<-1
        while(i-n >= 1 && is.na(data[i-n]) == TRUE){
          n<-n+1
        }
# count the distance  from the NA entry to the front entry 
        if(i-n >= 1){
          if(is.na(data[i-n]) == FALSE){
            before <- data[i-n]
          }
          else{
            n <- 0
          }
        }
        else{
          n<-0
        }
# operation to the non-NA entry before NA entry
# for if the entry is not in the frame or the entry is actually a number
        
        m<-1
        while(i+m <= length(data) && is.na(data[i+m]) == TRUE){
          m<-m+1
        } 
# count the distance  from the NA entry to the after entry 
        if(i+m <= length(data)){
          if(is.na(data[i+m]) == FALSE){
            after <- data[i+m]
          }
          else{
            m <- 0
          }
        }
        else{
          m<-0
        }
# operation to the non-NA entry after NA entry
# for if the entry is not in the frame or the entry is actually a number 
          if(n != 0){
            if(m != 0){
              c <- (n*after+m*before)/(n+m)
              data[i]<- c
            }
            else{
              data[i] <- before
            }
          }
          else if(m != 0){
            data[i] <- after
# replace the original data(NA) to the new data from the formula
# or replace NA with the only found before/after argument
          }
        }
      }
    }
  data
}