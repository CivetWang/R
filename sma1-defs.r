replace_one_phrase <- function (text, phrase){
  v <- c()
  i <- 1
  while(i <= length(text)){
    if (text[i] == phrase[1] && text[i+1] == phrase[2]){ 
        K <- paste(phrase[1], phrase[2],sep="_")
        i<- i+2
        }
    else{
      K <- text[i]
      i<-i+1
    }
    v <- c(v,K)
  }
  v
}



replace_phrases <- function (text, phrase_list) {
  vec <- replace_one_phrase(text, phrase_list[[1]])
  for (phrase in phrase_list[2:length(phrase_list)]) {
    vec <- replace_one_phrase(vec, phrase)
  }
  vec
}


