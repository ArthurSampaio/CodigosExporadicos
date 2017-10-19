library(dplyr)


partidos_unico = function(){
  
  dados <- read.csv("~/Downloads/consulta_cand_2016/dadosPB.txt", header=FALSE, sep=";")
  
  
  partidos = dados %>% select(V19)
  partidos$V19 = as.character(partidos$V19)
  partidos <- partidos[!duplicated(partidos), ]
  
  
  set.seed(1)
  part = c()
  masc = c()
  fem = c()
  i = 0
  
  for (partido in partidos){
    i = i + 1
    part[i] <- partido
    d = dadosPB %>% filter(Partido == partido) %>% count(sexo)
    h =  d %>% filter(sexo == "MASCULINO")
    masc[i] <- h$n
    m = d %>% filter(sexo == "FEMININO")
    fem[i] <- m$n
  
  }
  
  partidosUnicos = data.frame(part, masc, fem)
  
  return (partidosUnicos)

} 