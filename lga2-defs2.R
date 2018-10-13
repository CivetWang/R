get_most_common_word <- function(words){
  first_half <- words[1:half_length]
  data_first_half <- get_df(first_half)
  most_common <- as.vector(data_first_half[which.max(data_first_half$Freq), ]$Word)
}


prediction_of_second<-function(first_half){
  res <- c(first_half[length(first_half)])
  for (word in second_half[1:length(second_half)-1]){
    if (word %in% first_half) {
      next_words <- first_half[which(first_half == word) + 1]
      res <- c(res, names(sort(table(next_words),decreasing=TRUE)[1]))
    } 
    else {
      res <- c(res, most_common)
    }
  }
  res
}





