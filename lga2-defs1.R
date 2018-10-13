get_df <- function(Word) {
  data <- as.data.frame(table(Word))
  data$Rank <- rank(-data$Freq, ties.method = "min")
  
  data$log.Freq <- log(data$Freq)
  data$log.Rank <- log(data$Rank)
  
  data
}