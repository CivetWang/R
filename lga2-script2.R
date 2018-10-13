#'CSC121 Large assignment 2 Run script 2
# Source all processed data and function
source("lga2-defs1.R")
source("lga2-defs2.R")
source("lga2-script1.R")

#Produce The halves
half_length <- length(words) %/% 2
first_half <- words[1:half_length]
second_half <- words[(half_length + 1):length(words)]

#Construct the data frames of dfferent halves
data_first_half <- get_df(first_half)
data_second_half <- get_df(second_half)

# Take most common word
get_most_common_word(first_half)
most_common
#First method
prediction<-c(rep(most_common,length(second_half)))
prediction

#'To calculate predictions accuracy of second method
library(MASS)
fractions(length(which(prediction == second_half))/length(second_half))
#' So we can get about 3.3% accuracy prediction from this method


#second method
system.time(res<-prediction_of_second(first_half))
res

#'To calculate predictions accuracy of second method

fractions(length(which(res == second_half))/length(second_half))
#' So we can get about 11% accuracy prediction from method
#' instead of 3.3% just replacing all with the common word.

