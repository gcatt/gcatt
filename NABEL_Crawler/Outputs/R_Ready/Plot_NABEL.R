#NABEL Plots

#librarys

library(ggplot2)
library(ggthemes)
library(stats)
library(lubridate)
library(sf)
library(dplyr)

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
ZUE<-read.csv("C:/Users/ginoc/Git_Repos/gcatt/NABEL_Crawler/Outputs/R_Ready/ZUE_clean.csv",stringsAsFactors = FALSE)


#Convert Column 'Datum.Zeit' to Date
BAS$Datum.Zeit<-as.Date(BAS$Datum.Zeit, format = "%d.%m.%Y")
BER$Datum.Zeit<-as.Date(BER$Datum.Zeit, format = "%d.%m.%Y")
BRM$Datum.Zeit<-as.Date(BRM$Datum.Zeit, format = "%d.%m.%Y")
CHA$Datum.Zeit<-as.Date(CHA$Datum.Zeit, format = "%d.%m.%Y")
DAV$Datum.Zeit<-as.Date(DAV$Datum.Zeit, format = "%d.%m.%Y")
DUE$Datum.Zeit<-as.Date(DUE$Datum.Zeit, format = "%d.%m.%Y")
HAE$Datum.Zeit<-as.Date(HAE$Datum.Zeit, format = "%d.%m.%Y")
JUN$Datum.Zeit<-as.Date(JUN$Datum.Zeit, format = "%d.%m.%Y")
LAU$Datum.Zeit<-as.Date(LAU$Datum.Zeit, format = "%d.%m.%Y")
LUG$Datum.Zeit<-as.Date(LUG$Datum.Zeit, format = "%d.%m.%Y")
MAG$Datum.Zeit<-as.Date(MAG$Datum.Zeit, format = "%d.%m.%Y")
PAY$Datum.Zeit<-as.Date(PAY$Datum.Zeit, format = "%d.%m.%Y")
RIG$Datum.Zeit<-as.Date(RIG$Datum.Zeit, format = "%d.%m.%Y")
SIO$Datum.Zeit<-as.Date(SIO$Datum.Zeit, format = "%d.%m.%Y")
TAE$Datum.Zeit<-as.Date(TAE$Datum.Zeit, format = "%d.%m.%Y")
ZUE$Datum.Zeit<-as.Date(ZUE$Datum.Zeit, format = "%d.%m.%Y")

#Check Formats
str(BAS)
str(BER)
str(BRM)
str(CHA)
str(DAV)
str(DUE)
str(HAE)
str(JUN)
str(LAU)
str(LUG)
str(MAG)
str(PAY)
str(RIG)
str(SIO)
str(TAE)
str(ZUE)

summary(BAS)

BAS_O3<-ggplot(data = BAS, mapping = aes(y = O3..ug.m3., x = Datum.Zeit)) +
  geom_line(color="darkblue")+
  geom_point() +
  ggtitle("Concentration of O3 in Basel")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 200)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2018-01-01"),as.Date("2020-02-28")))  
plot(BAS_O3)


BAS_NO2<-ggplot(data = BAS, mapping = aes(y = NO2..ug.m3., x = Datum.Zeit)) +
  geom_line(color="darkblue")+
  geom_point() +
  ggtitle("Concentration of NO2 in Basel")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 50)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2018-01-01"),as.Date("2020-02-28")))  
plot(BAS_NO2)


BAS_SO2<-ggplot(data = BAS, mapping = aes(y = SO2..ug.m3., x = Datum.Zeit)) +
  geom_line(color="darkblue")+
  geom_point() +
  ggtitle("Concentration of SO2 in Basel")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 10)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-02-28")))  
plot(BAS_SO2)