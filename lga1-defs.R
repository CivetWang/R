simulate_queue <- function (open_time, rate, low, high){
  a_t<-c()
  d_t<-c()
  q_l<-c(0)
  arrive<-0
# set all needs for result
  while(arrive <= open_time){
    arr <- rexp(1,rate)
    if (arrive+arr <= open_time){
      arrive <- arrive+arr
      a_t<-c(a_t,arrive)
    }
    else
      arrive <- arrive+arr
  }
# generate the arrvial vector for result output
  serve_t<-runif(length(a_t),low,high)
  d_t<-a_t+serve_t
# generate the departure vector depends on arrival
  i<-2
  while(i<=length(d_t)){
    if(d_t[i] <= d_t[i-1]){
      d_t[i]<-d_t[i-1]+runif(1,low,high)
    }
    i<-i+1
  }
# check the right data perform  
  n<-2
  while(n<=length(a_t)){
    queue<-c(d_t[1:n-1])
    w<-1
    while(w<=n){
     if(a_t[n] > d_t[w]){
      queue<-queue[-1]
      w<-w+1
     }
     else if(n>w){
      w<-w+1
    }
    else if(n==w){
      w<-w+1
    }
    }
      q_l<-c(q_l,length(queue))
      n<-n+1
  }
# calculate the queue for each arrival
  res<-list(arrival_times=a_t,queue_lengths=q_l,departure_times=d_t)
  res
#output
}


run_simulations <- function (seeds, open_time, rate, low, high) {
  num <- length(seeds)
  res <- as.data.frame(list(
    seed = seeds,
    open_time = rep(open_time, num),
    rate = rep(rate, num),
    low = rep(low, num),
    high = rep(high, num)
  ))
# create the date frame for output 
  values <- data.frame(served=numeric(),
                       maxqueue=numeric(), 
                       avewait=numeric(), 
                       overtime=numeric()) 
# open the colums of other data frame for later cbind
  for (seed in seeds) {
    set.seed(seed)
    temp <- simulate_queue(open_time, rate, low, high)
    # call the first function to run through
    served <- length(temp$arrival_times)
    maxqueue <- max(temp$queue_lengths)
    avewait <- mean(temp$departure_times - temp$arrival_times)
    # treat necessary data
    overtime <- 0
    if (temp$departure_times[length(temp$departure_times)] > open_time) {
      overtime <- temp$departure_times[length(temp$departure_times)] - open_time
    }
    # get the num of overtime
    values <- rbind(values, data.frame(served, maxqueue, avewait, overtime))
    # rbind data frame
  }
  res <- cbind(res, values)
  # cbind the rest
  res
  #output
}