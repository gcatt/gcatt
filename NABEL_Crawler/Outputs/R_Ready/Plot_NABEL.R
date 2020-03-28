library(dplyr)
library(ggplot2)


ggplot() +
  geom_smooth(data = AQI20_Beijing20, aes(x = date, y = AQI, color = "2020")) +
  geom_smooth(data = AQI20_Beijing19_123, aes(x = (date + 1*365), y = AQI, color = "2019")) +
  geom_smooth(data = AQI20_Beijing18_123, aes(x = (date + 2*365), y = AQI, color = "2018")) +
  xlab('Dates') +
  ylab('AQI')+
  ggtitle("Air Quality Index Beijing")+
  scale_colour_manual(name="Legend", values=c("orange", "red", "blue"))+
  theme(legend.position="right")