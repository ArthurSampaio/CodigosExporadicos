library(tidyverse)
library(lubridate)


riscos_mapeados <- read_csv("~/Documentos/CodigosExporadicos/python/riscos_mapeados.csv")

riscos_mapeados %>%
  ggplot(aes(x = semana, y = probabilidade)) + 
  geom_line(aes(linetype = risco, color = risco)) + facet_wrap(~categoria) + theme_bw() +
  labs(title = "Gerência de Risco por Categoria e Semana", 
       x = "Semanas", y = "Probabilidade do risco acontecer") + scale_fill_brewer()


library(plotly)
