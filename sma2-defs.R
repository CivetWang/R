find_distances <- function (map, target) {
  mat <- map 
  res <- matrix(Inf, nrow = nrow(mat),ncol = ncol(mat))
# get a matrix copy of the map and anotherInf copy with same size for output
  res[target[1],target[2]]<-0
#Give the initial point
  counter <- 1
# give an counter for a loop needs to start
  while(counter != 0){
# starts the loop and keeps going if previos loop still proceeded data
    counter <- 0
#set the counter to 0 every time
    m <- 1
    n <- 1
   while(m <= nrow(res)){
     while(n <= ncol(res)){
      # make sure all operation take place in the range of the map
      if(mat[target[1],target[2]] == "X"){
        res[target[1],target[2]] <- 0
      }
      #verify if the target is on the obstacle
      else if (res[m,n] != Inf){
       # search the valid source of target not equal to "x"
           c <- res[m,n]
           if(m+1<=nrow(res)){
             if(res[m+1,n] > c+1 && mat[m+1,n] != "X"){
              res[m+1,n] <- c+1
              counter <- counter+1
              }
            }
           if(m-1 >= 1){
             if(res[m-1,n] > c+1 && mat[m-1,n] != "X"){
             res[m-1,n] <- c+1
             counter <- counter+1
             }
           }
           if(n+1<=ncol(res)){
              if(res[m,n+1] > c+1 && mat[m,n+1] != "X"){
              res[m,n+1] <- c+1
              counter <- counter+1
              }
            }
           if(n-1 >= 1){
              if(res[m,n-1] > c+1 && mat[m,n-1] != "X"){
              res[m,n-1] <- c+1
              counter <- counter+1
              }
            }
           # four ways of operate the data and output to the matrix
           # counter is a counter to keep running of the operation 
     }
      n <- n+1
      # search for the next col
    }
    m <- m+1
    n <- 1
    #search the next row from the most left
  }
  }
  res
}
