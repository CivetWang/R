map <- matrix (c ( 
  " ", "X", " ", " ",
  "X", " ", "X", " ",
  "X", " ", "X", " ",
  " ", " ", " ", " ",
  " ", " ", " ", " "), 
  nrow=5, ncol=4, byrow=TRUE)

map

find_distances(map,c(1,4))

find_distances(map,c(3,2))

find_distances(map,c(2,3))


line_map <- matrix (c ( 
  " ", "X", " ", " ",
  " ", "X", " ", " ",
  " ", "X", " ", " ",
  " ", "X", " ", " ",
  " ", "X", " ", " "), 
  nrow=5, ncol=4, byrow=TRUE)

line_map

find_distances(line_map,c(2,3))

find_distances(line_map,c(1,1))

find_distances(line_map,c(2,2))

full_map<- matrix (c ( 
  "X", "X", "X", "X",
  "X", "X", "X", "X",
  "X", "X", "X", "X",
  "X", "X", "X", "X",
  "X", "X", "X", "X",
  "X", "X", "X", "X",
  "X", "X", "X", "X",
  "X", "X", "X", "X",
  "X", "X", "X", "X",
  "X", "X", "X", "X"), 
  nrow=5, ncol=8, byrow=TRUE)

full_map

find_distances(full_map,c(2,2))

find_distances(full_map,c(3,5))

