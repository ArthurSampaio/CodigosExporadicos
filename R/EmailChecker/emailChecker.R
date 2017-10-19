# Developed by Arthur Sampaio 
# Enjoy without moderation! 

#This code checks whether a set of emails is valid, and if it does not, will try to correct them.
#After the execution, this code create a new csv with the same name

#For help you to understand the code: 

#csv.used is the dataset which you will validate the emails 
#csvFalse is the dataset who contains the invalid emails

#keep in your heart: ls | while read a; do mv "$a" $(echo $a | tr ' ' '_' |  iconv -f utf8 -t ascii//TRANSLIT); done

library(dplyr)


#you will put the names of files in this vector
#files = c("etc")


isValidEmail <- function(x) {
  grepl("\\<^[^@[:space:]]+@[^@[:space:]]+$\\>", as.character(x), ignore.case=TRUE)
}

repairsEmail <- function(x){
  gsub("[[:blank:]]", "", as.character(x))
  
}


#add the path of your csv
path = "~/Downloads/ListaAlunos"
#add the name of file.csv

  for (file in files){
  
  file = disciplina
  path = "~/Downloads/ListaAlunos"
  directory = paste(path, file, sep = "/")
  
  #loading the dataframe
  csv.used = read.csv(directory, header = T)
  
  #add a column who indicate if the email is availables
  #csv.used = csv.used %>% mutate(emailValid = isValidEmail(__COLUMN_WHO_CONTAIS_THE_EMAILS))
  csv.used = csv.used %>% mutate(emailValid = isValidEmail(email))
  #separate and corrects invalid emails
  csvFalse = csv.used %>% filter(emailValid == "FALSE") %>% mutate(email = repairsEmail(email)) %>% mutate(emailValid = isValidEmail(email))
  
  csv.used = csv.used %>% filter(emailValid == "TRUE")
  
  #Append the csv.used in csvFalse 
  csv.used = bind_rows(csvFalse, csv.used)
  #remove duplicated lines
  csv.used <- csv.used[!duplicated(csv.used), ]
  
  
  
  #Override the csv file
  write.csv2(csv.used, file = directory, row.names = F)
  
}




