library(tidyverse)
library(FrF2)


first.algorithm <- "QUICK"
second.algorithm <- "MERGE"

heap <- read.csv2("~/SortingAlgorithmsMC/heap.txt")
merge <- read.csv2("~/SortingAlgorithmsMC/merge.txt")
quick <- read.csv2("~/SortingAlgorithmsMC/quick.txt")

heap$time <- as.double(heap$time)
merge$time <- as.double(merge$time)
quick$time <- as.double(quick$time)



ExperimentFactorial <- function(heap, merge, quick) {
  

  
  plan <- FrF2(nfactors = 3, nruns = 2^3, replications = 50, repeat.only = TRUE, 
               randomize = TRUE, factor.names = list(Algorithm = c(first.algorithm, second.algorithm),
                                                     size = c("Low", "High"),
                                                     type = c("REVERSE", "RANDOM")))
  
  results = ResponseBalance(plan, merge, quick)
  
}

ResponseBalance <- function(plan, sort1, sort2) {
  
  if(line[1] == first.algorithm){
    if(line[2]/4500 && line[3] == "REVERSE"){
      
    }
  }else{
    
  }
  
  
}


FindRow <- function(line, sort1, sort2) {
  

}

FindSizeType <- function (tamanho) {
  print(tamanho)

  if(tamanho > 45000){
    type <- "High"
  }else{
    type <- "Low"
  }
  
  return (type)
}



