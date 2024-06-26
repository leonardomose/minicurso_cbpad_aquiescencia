library(lavaan)


## Simulando dados de um questionário BALANCEADO com 12 itens
### 3 fatores de conteúdo e 1 fator geral de aquiescência

modelSim1 <-
  'Trait1 =~ .6*y1 + (-.6)*y2 + .6*y3 + (-.6)*y4
   Trait2 =~ .6*y5 + (-.6)*y6 + .6*y7 + (-.6)*y8
   Trait3 =~ .6*y9 + (-.6)*y10 + .6*y11 + (-.6)*y12

   Acq =~ .4*y1 + .4*y2 + .4*y3 + .4*y4 + .4*y5 + .4*y6 + .4*y7 + .4*y8 + .4*y9 + .4*y10 + .4*y11 + .4*y12
   
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
   Trait1 ~~ .3*Trait2
   Trait2 ~~ .3*Trait3
   Trait1 ~~ .3*Trait3'

set.seed(123)
data_acq_bal <- simulateData(
  model = modelSim1, 
  model.type = "cfa", 
  std.lv = TRUE,
  sample.nobs = 2000L)

data_acq_bal$mean_acq <- round(rowMeans(data_acq_bal), 4)

write.csv(data_acq_bal, file = "../dados/data_acq_balanced.csv",
          row.names = FALSE)

write.table(data_acq_bal, file = "../dados/data_acq_balanced.txt",
          row.names = FALSE, col.names = FALSE, sep = "\t")
