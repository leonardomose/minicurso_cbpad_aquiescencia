library(lavaan)


## Simulando dados de um questionário DESBALANCEADO com 12 itens
### 3 fatores de conteúdo e 1 fator geral de aquiescência

modelSim2 <-
  'Trait1 =~ .7*y1 + (-.7)*y2 + .7*y3 + .7*y4
   Trait2 =~ .7*y5 + (-.7)*y6 + .7*y7 + (-.7)*y8
   Trait3 =~ .7*y9 + (-.7)*y10 + .7*y11 + .7*y12

   Acq =~ .5*y1 + .5*y2 + .5*y3 + .5*y4 + .5*y5 + .5*y6 + .5*y7 + .5*y8 + .5*y9 + .5*y10 + .5*y11 + .5*y12
    
    y1 | -1.5*t1 + -.5*t2 + .5*t3 + 1.5*t4
    y2 | -1.5*t1 + -.5*t2 + .5*t3 + 1.5*t4
    y3 | -1.5*t1 + -.5*t2 + .5*t3 + 1.5*t4
    y4 | -1.5*t1 + -.5*t2 + .5*t3 + 1.5*t4
    y5 | -1.5*t1 + -.5*t2 + .5*t3 + 1.5*t4
    y6 | -1.5*t1 + -.5*t2 + .5*t3 + 1.5*t4
    y7 | -1.5*t1 + -.5*t2 + .5*t3 + 1.5*t4
    y8 | -1.5*t1 + -.5*t2 + .5*t3 + 1.5*t4
    y9 | -1.5*t1 + -.5*t2 + .5*t3 + 1.5*t4
    y10 | -1.5*t1 + -.5*t2 + .5*t3 + 1.5*t4
    y11 | -1.5*t1 + -.5*t2 + .5*t3 + 1.5*t4
    y12 | -1.5*t1 + -.5*t2 + .5*t3 + 1.5*t4
    
   Trait1 ~~ 0*Acq
   Trait2 ~~ 0*Acq
   Trait3 ~~ 0*Acq
   Trait1 ~~ 1*Trait1
   Trait2 ~~ 1*Trait2
   Trait3 ~~ 1*Trait3
   Acq ~~ 1*Acq
   Trait1 ~~ .2*Trait2
   Trait2 ~~ .2*Trait3
   Trait1 ~~ .2*Trait3'

set.seed(123)
data_acq_unbal <- simulateData(
  model = modelSim2, 
  model.type = "cfa", 
  std.lv = TRUE,
  sample.nobs = 2000L)

write.csv(dataAcq, file = "../dados/data_acq_unbalanced.csv", 
          row.names = FALSE)
