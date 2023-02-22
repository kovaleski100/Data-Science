pathName = "C:/Users/mat-v/Desktop/git/Data Science/data tratment"
setwd(pathName)

#Analise Exploratoria
data = read.csv("tempo.csv", sep = ";", na.strings = "", stringsAsFactors = T)
summary(data)

#dados fatoraveis
ct = table(data$Aparencia)
barplot(ct)
ct = table(data$Vento)
barplot(ct)
ct = table(data$Jogar)
barplot(ct)

#dados numericos
summary(data$Temperatura)
boxplot(data$Temperatura)
boxplot(data$Temperatura, outline = F)
summary(data$Umidade)
boxplot(data$Umidade)
boxplot(data$Umidade, outline = F)
data[!complete.cases(data),]

#correção Aparencia
data[data$Aparencia == "menos",]$Aparencia = "sol"
summary(data$Aparencia)
data$Aparencia = factor(data$Aparencia)
summary(data$Aparencia)

#correção temperatura
summary(data$Temperatura)
data[data$Temperatura < -130 | data$Temperatura > 130,]$Temperatura
med = median(data$Temperatura)
data[data$Temperatura < -130 | data$Temperatura > 130,]$Temperatura = med
summary(data$Temperatura)
boxplot(data$Temperatura)

#correção umidade
summary(data$Umidade)
data[data$Umidade<0 | data$Umidade> 100,]$Umidade
med = median(data$Umidade, na.rm = T)
data[is.na(data$Umidade),]$Umidade = med
data[data$Umidade<0 | data$Umidade> 100,]$Umidade = med
summary(data$Umidade)

#correção vento
summary(data$Vento)
data[is.na(data$Vento),]$Vento = "FALSO"
summary(data$Vento)