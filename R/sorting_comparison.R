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
                                                     array = c(RANDOM, REVERSE)))
  
  plan.reduzido <- FrF2(nfactors = 2, nruns = 2^2, replications = 25, repeat.only = TRUE, 
                        randomize = TRUE, factor.names = list(Algorithm = c(first.algorithm, second.algorithm),
                                                              size = c("Low", "High")
                                                            ))
  
  response.times <- do.call(rbind.data.frame, apply(plan, 1, FindRow, sort1 = quick, sort2 = merge))

  response.reduzido <- do.call(rbind.data.frame, apply(plan.reduzido, 1, FindRow, sort1 = quick, sort2 = merge))
  
  time = response.times[4]
  time.reduzido = response.reduzido[4]
  plan.actual <- add.response(design = plan, response = time)
  
}

GenerateGraphs <- function(plan.actual) {
  
  directory.name = "/SortingAlgorithmsMC/2k"
  
  path = paste(getwd(), directory.name, sep="")
  createDirectoryImg(directory.name)

  
  #takes the name of the resource studied in the design 
  resource.name <- names(plan.actual)[4]
  
  # 1. Main effects of plot
  png(file=paste(path,"/ME",resource.name, ".png", sep=""))
  MEPlot(plan.actual, abbrev = 5, cex.xax = 1.6, cex.min = 2)
  dev.off()
  print("Main effects")
  
  
  # 2. Interaction plots
  png(file=paste(path, "/Iplot", resource.name, ".png", sep=""))
  IAPlot(plan.actual, abbrev = 5, cex.xax = 1.6, cex.min = 2, lwd=2, show.alias = TRUE)
  dev.off()
  print("Interaction Plots")
  
  
  # 3. Linear Model
  
  residuals = summary(lm(data = plan.actual, time ~ (Algorithm + size + array)^2))$residuals
  
  png(file=paste(path, "/LinearModel", resource.name, ".png", sep=""))
  qqnorm(a$residuals)
  qqline(a$residuals)
  dev.off()
  print("Interaction Plots")
  
  
  # 4. Half Normal
  
  plan.sd <- aggregate(reptowide(plan.actual), FUN="sd")
  png(file=paste(path, "/HN", resource.name, ".png", sep=""))
  DanielPlot(plan.sd, half=TRUE, alpha = 0.1, cex.main = 1.8, cex.legend = 1.2)
  dev.off()
  
  
}

createDirectoryImg = function(folder.name) {
  
  if(!(dir.exists(file.path(path, folder.name)))){
    dir.create(file.path(path, folder.name))
    paste("Directory created")
    
  }else{
    paste("Directory already exists")
  }
  
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
     
        row <- sort2 %>% filter(size_type >= 1) %>% sample_n(1)
      
      
    }else{#LOW
      
        row <- sort2 %>% filter(size_type < 1) %>% sample_n(1)
      }
    }
  }

  return (row)
}






