#' CSC 121, Jan-Apr 2017, Large Assignment #1, Test script
#' This is the test run for my script of definition if the function
#' with the original result and bigger simulation being covered
#' in the output as a 200 row data frame.
#+ setup,include=FALSE
source("http://www.cs.utoronto.ca/~radford/csc121/options.r")
#+
source("lga1-defs.R")
# set the seed to 1

set.seed(1)
#' show the result of the originial situation
simulate_queue(10, 0.7, 1, 2)
#'To start the simulation of requested situation
#'We need to start with set the seeds for each 
#'row and create four different parts that would
#'combined to be the final data frame.
seeds <- round(runif(200, 1, 10000))

# Group 1
group1<-run_simulations(seeds[1:50], 100, 0.5, 1.0, 2.0)
# Group 2
group2<-run_simulations(seeds[51:100], 100, 0.8, 1.0, 2.0)
# Group 3
group3<-run_simulations(seeds[101:150], 100, 0.5, 1.4, 1.6)
# Group 4
group4<-run_simulations(seeds[151:200], 100, 0.8, 1.4, 1.6)

#' Combine all the results and output as one data frame 
df <- rbind(rbind(group1, group2), rbind(group3, group4))
df
#+
df1 <- df[df$rate == 0.5, ]
df1green <- df1[(df1$low==1.4),]
df1red <- df1[(df1$low == 1.0),]

#'Plot the diagram of "Served vs. Avewait"
#'with green as the lowest serve time is 1.4
#' and red as the lowest serve time is 1.0 
#' and the overall exponential distribution rate of 0.5
plot(df1red$served, df1red$avewait, type = "p", col="red", 
     main="Plot with Rate=0.5 with different Low/High", xlab="Served", ylab="Avewait")
points(df1green$served, df1green$avewait, pch=1, col="green")

df2 <- df[df$rate == 0.8, ]
df2green <- df2[(df2$low==1.4),]
df2red <- df2[(df2$low == 1.0),]


#'Plot the diagram of "Served vs. Avewait"
#'with green as the lowest serve time is 1.4
#' and red as the lowest serve time is 1.0 
#' and the overall exponential distribution rate is 0.8 
plot(df2red$served, df2red$avewait, type = "p", col="red", 
     main="Plot with Rate=0.8 with different Low/High", xlab="Served", ylab="Avewait")
points(df2green$served, df2green$avewait, pch=1, col="green")

#'As conslusion, while the exponetial rate has an increase, like from [0.5] to [0,8]
#'the number of served would be pulled up dramatically forom [35~60] to [60~100]
#'at the same time , the average wait time would be also pulled up from
#'[5] to a max of [30].
#+
#' At the same time, the average wait datas shows the same 
#' pattern as the exponetial distributionas the serverd amount runs up.
#' 