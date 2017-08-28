library(tidyverse)
library(FrF2)


first.algorithm <- "QUICK"
second.algorithm <- "MERGE"

RANDOM <- "RANDOM"
REVERSE <- "REVERSE"

heap <- read.csv2("~/SortingAlgorithmsMC/heap.txt")
merge <- read.csv2("~/SortingAlgorithmsMC/merge.txt")
quick <- read.csv2("~/SortingAlgorithmsMC/quick.txt")

heap$time <- as.double(heap$time)
merge$time <- as.double(merge$time)
quick$time <- as.double(quick$time)

heap <- heap %>% filter(array_type != "SORTED") %>% mutate(size_type = size/90000)
merge <- merge %>% filter(array_type != "SORTED") %>% mutate(size_type = size/90000)
quick <- quick %>% filter(array_type != "SORTED") %>% mutate(size_type = size/90000)



ExperimentFactorial <- function(heap, merge, quick) {
  

  
  plan <- FrF2(nfactors = 3, nruns = 2^3, replications = 50, repeat.only = TRUE, 
               randomize = TRUE, factor.names = list(Algorithm = c(first.algorithm, second.algorithm),
                                                     size = c("Low", "High"),
                                                     type = c("REVERSE", "RANDOM")))
  
  response.times <- do.call(rbind.data.frame, apply(plan, 1, FindRow, sort1 = quick, sort2 = merge))

  plan.actual <- add.response(design = plan, response = response.times[4])
  
}


FindRow <- function(line, sort1, sort2 ) {
  
  if(line[1] == first.algorithm){
    if(line[2] == "High"){
      if(line[3] == RANDOM){
        row <- sort1 %>% filter(size_type >= 1 & array_type == RANDOM) %>% sample_n(1)
      }else{ #REVERSE
        row <- sort1 %>% filter(size_type >= 1 & array_type == REVERSE) %>% sample_n(1)
      }
      
    }else{#LOW
      if(line[3] == RANDOM){
        row <- sort1 %>% filter(size_type < 1 & array_type == RANDOM) %>% sample_n(1)
      }else{ #REVERSE
        row <- sort1 %>% filter(size_type < 1 & array_type == REVERSE) %>% sample_n(1)
      }
    }

  }else{
    if(line[2] == "High"){
      if(line[3] == RANDOM){
        row <- sort2 %>% filter(size_type >= 1 & array_type == RANDOM) %>% sample_n(1)
      }else{ #REVERSE
        row <- sort2 %>% filter(size_type >= 1 & array_type == REVERSE) %>% sample_n(1)
      }
      
    }else{#LOW
      if(line[3] == RANDOM){
        row <- sort2 %>% filter(size_type < 1 & array_type == RANDOM) %>% sample_n(1)
      }else{ #REVERSE
        row <- sort2 %>% filter(size_type < 1 & array_type == REVERSE) %>% sample_n(1)
      }
    }
  }

  return (row)
}






