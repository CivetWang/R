t <- c("I","like","hot","dogs","a","lot","hot","dogs","forever")
replace_one_phrase(t,c("hot","dogs"))

replace_one_phrase(c("a","xx","xx","xx","b"),c("xx","xx"))

replace_phrases (c("ab","pq","xy"), list(c("ab","pq"),c("pq","xy")))

test_text1 <- c(
  "I","went","South","to","North","Dakota","then","South","to","South","Carolina")
test_text2 <- c(
  "North","Dakota","is","North","of","South","Dakota","which","North","Dakota",
  "is","North","of")

replace_one_phrase (test_text1,c("North","Dakota"))
replace_one_phrase (test_text1,c("South","Carolina"))
replace_one_phrase (test_text2,c("North","Dakota"))

phrases <- list(c("North","Dakota"),    c("South","Dakota"),
                c("North","Carolina"),  c("South","Carolina"),
                c("New","Brunswick"),   c("British","Columbia"))

replace_phrases (test_text1, phrases)
replace_phrases (test_text2, phrases)

m <- c("He","loves","to","play","games", "He","also","loves","to","play","games",
       "with","friends")
gamephrase <- list(c("also","loves"),c("loves","to"),
                   c("to","play"),c("play","games"))
replace_one_phrase(m,c("to","play"))
replace_phrases(m,gamephrase)


Nanjo <- c("Nanjo", "Nanjo","Nanjo","nanjolo","nanjolo","nanjolo")
Nanjo.sets <- list(c("Nanjo","Nanjo"),c("Nanjo","nanjolo"),
                  c("nanjolo","nanjolo"))
replace_phrases(Nanjo,Nanjo.sets)
replace_one_phrase(Nanjo,c("Nanjo","Nanjo"))
