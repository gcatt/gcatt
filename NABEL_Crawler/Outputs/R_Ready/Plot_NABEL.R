#NABEL Plots

#librarys

library(ggplot2)
library(ggthemes)
library(stats)
library(lubridate)

#Read in Data
BAS<-read.csv("C:/Users/ginoc/Git_Repos/gcatt/NABEL_Crawler/Outputs/R_Ready/BAS_clean.csv",stringsAsFactors = FALSE)
BER<-read.csv("C:/Users/ginoc/Git_Repos/gcatt/NABEL_Crawler/Outputs/R_Ready/BER_clean.csv",stringsAsFactors = FALSE)
BRM<-read.csv("C:/Users/ginoc/Git_Repos/gcatt/NABEL_Crawler/Outputs/R_Ready/BRM_clean.csv",stringsAsFactors = FALSE)
CHA<-read.csv("C:/Users/ginoc/Git_Repos/gcatt/NABEL_Crawler/Outputs/R_Ready/CHA_clean.csv",stringsAsFactors = FALSE)
DAV<-read.csv("C:/Users/ginoc/Git_Repos/gcatt/NABEL_Crawler/Outputs/R_Ready/DAV_clean.csv",stringsAsFactors = FALSE)
DUE<-read.csv("C:/Users/ginoc/Git_Repos/gcatt/NABEL_Crawler/Outputs/R_Ready/DUE_clean.csv",stringsAsFactors = FALSE)
HAE<-read.csv("C:/Users/ginoc/Git_Repos/gcatt/NABEL_Crawler/Outputs/R_Ready/HAE_clean.csv",stringsAsFactors = FALSE)
JUN<-read.csv("C:/Users/ginoc/Git_Repos/gcatt/NABEL_Crawler/Outputs/R_Ready/JUN_clean.csv",stringsAsFactors = FALSE)
LAU<-read.csv("C:/Users/ginoc/Git_Repos/gcatt/NABEL_Crawler/Outputs/R_Ready/LAU_clean.csv",stringsAsFactors = FALSE)
LUG<-read.csv("C:/Users/ginoc/Git_Repos/gcatt/NABEL_Crawler/Outputs/R_Ready/LUG_clean.csv",stringsAsFactors = FALSE)
MAG<-read.csv("C:/Users/ginoc/Git_Repos/gcatt/NABEL_Crawler/Outputs/R_Ready/MAG_clean.csv",stringsAsFactors = FALSE)
PAY<-read.csv("C:/Users/ginoc/Git_Repos/gcatt/NABEL_Crawler/Outputs/R_Ready/PAY_clean.csv",stringsAsFactors = FALSE)
RIG<-read.csv("C:/Users/ginoc/Git_Repos/gcatt/NABEL_Crawler/Outputs/R_Ready/RIG_clean.csv",stringsAsFactors = FALSE)
SIO<-read.csv("C:/Users/ginoc/Git_Repos/gcatt/NABEL_Crawler/Outputs/R_Ready/SIO_clean.csv",stringsAsFactors = FALSE)
TAE<-read.csv("C:/Users/ginoc/Git_Repos/gcatt/NABEL_Crawler/Outputs/R_Ready/TAE_clean.csv",stringsAsFactors = FALSE)

as.Date(BAS$Datum.Zeit, '%d/%m/%Y')

str(BAS)
head(BAS)

ggplot() +
  geom_smooth(data = AQI20_Beijing20, aes(x = date, y = AQI, color = "2020")) +
  geom_smooth(data = AQI20_Beijing19_123, aes(x = (date + 1*365), y = AQI, color = "2019")) +
  geom_smooth(data = AQI20_Beijing18_123, aes(x = (date + 2*365), y = AQI, color = "2018")) +
  xlab('Dates') +
  ylab('AQI')+
  ggtitle("Air Quality Index Beijing")+
  scale_colour_manual(name="Legend", values=c("orange", "red", "blue"))+
  theme(legend.position="right")