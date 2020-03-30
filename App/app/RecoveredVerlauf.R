#Recovered Curve

library(readxl)
library(ggplot2)
library(ggthemes)

RecoveredDB<-read_excel("Statista_data/statistic_id1101076_entwicklung-der-weltweiten-anzahl-geheilter-corona-patienten--covid-19--in-2020.xlsx")
colnames(RecoveredDB)<-c("Datum","RecoveredNumber")
RecoveredDB<-RecoveredDB[-c(1,2),]
RecoveredDB$Datum <- as.Date(RecoveredDB$Datum, '%d. %b')




RecoveredGraph<-ggplot(data = RecoveredDB,
       mapping = aes(y = RecoveredNumber,
                     x = Datum
       )) +
  geom_point(color="darkblue")+
  ggtitle("Number of Recovered People worldwide")+
  ylab("Number of recovered People")+
  ylim(0, 200000)+
  theme(
    panel.background = element_rect(fill = 'white', colour = 'lightgrey', size = 0.5, linetype = "solid"), 
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "lightgrey"),
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "lightgrey"),# Background of the entire plot
    legend.position="right",)


