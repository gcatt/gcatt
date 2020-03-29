#Recovered Curve

library(readxl)
library(ggplot2)
library(ggthemes)

RecoveredDB<-read_excel("C:/Users/MrGaM/Desktop/statistic_id1101076_entwicklung-der-weltweiten-anzahl-geheilter-corona-patienten--covid-19--in-2020.xlsx")
colnames(RecoveredDB)<-c("Datum","RecoveredNumber")
RecoveredDB<-RecoveredDB[-c(1,2),]
RecoveredDB$Datum <- seq(as.Date("2020-01-21"), as.Date("2020-03-28"), by="days")




RecoveredGraph<-ggplot(data = RecoveredDB,
       mapping = aes(y = RecoveredNumber,
                     x = Datum
       )) +
  geom_point(color="darkblue")+
  ggtitle("Number of Recovered People worldwide")+
  ylab("Number of recovered People")+
  ylim(0, 200000)+
  theme_minimal()

plot(RecoveredGraph)
