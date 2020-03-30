#Flugzeug

library(ggplot2)
library(ggthemes)
library(lubridate)


Flugzeug<-read.csv("Statista_data/Flugzeug.csv",sep = ";")
colnames(Flugzeug)<-c("Week","Change")
Flugzeug$Change<-as.numeric(as.character(Flugzeug$Change))

end_date <- mdy("03-23-20")
Flugzeug$Week<-end_date - days(0:11*7:7)

Flightplot<-ggplot(data = Flugzeug,
       mapping = aes(y = Change,
                     x = Week
       )) +
  geom_line(color="darkblue", size=2)+
  ggtitle("Change of flight starts worldwide")+
  ylab("Change to average in %")+
  theme(
    panel.background = element_rect(fill = 'white', colour = 'lightgrey', size = 0.5, linetype = "solid"), 
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "lightgrey"),
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "lightgrey"),# Background of the entire plot
    legend.position="right",)


