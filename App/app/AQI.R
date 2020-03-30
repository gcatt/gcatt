#Air Quality Data

#librarys

library(ggplot2)
library(ggthemes)
library(stats)
library(lubridate)

#Read in Data
Air_Beijing<-read.csv("Data_International/beijing-air-quality.csv",stringsAsFactors = FALSE)
Air_Berlin<-read.csv("Data_International/berlin,-germany-air-quality.csv",stringsAsFactors = FALSE)
Air_Milano<-read.csv("Data_International/milano-senato, lombardia, italy-air-quality.csv",stringsAsFactors = FALSE)
Air_NY<-read.csv("Data_International/new-york, usa-air-quality.csv",stringsAsFactors = FALSE)
Air_Wuhan<-read.csv("Data_International/wuhan-air-quality.csv",stringsAsFactors = FALSE)


#Calculate overall AQI
head(Air_Beijing)
Air_Beijing$AQI<-apply(Air_Beijing[,2:ncol(Air_Beijing)],1,max)
Air_Berlin$AQI<-apply(Air_Berlin[,2:ncol(Air_Berlin)],1,max)
Air_Milano$AQI<-apply(Air_Milano[,2:(ncol(Air_Milano)-1)],1,max)
Air_NY$AQI<-apply(Air_NY[,2:ncol(Air_NY)],1,max)
Air_Wuhan$AQI<-apply(Air_Wuhan[,2:ncol(Air_Wuhan)],1,max)

#Format as Datum
Air_Beijing$date <- as.Date(Air_Beijing$date , format = "%Y/%m/%d")
Air_Berlin$date <- as.Date(Air_Berlin$date , format = "%Y/%m/%d")
Air_Milano$date <- as.Date(Air_Milano$date , format = "%Y/%m/%d")
Air_NY$date <- as.Date(Air_NY$date , format = "%Y/%m/%d")
Air_Wuhan$date <- as.Date(Air_Wuhan$date , format = "%Y/%m/%d")



#Plots over all Years
plot_bejing_all_years <- ggplot(data = Air_Beijing,
       mapping = aes(y = AQI,
                     x = date
       )) +
  geom_line(color="darkblue")+
  geom_smooth(color="red")+
  ggtitle("Air Quality Index Beijing")+
  theme(
    panel.background = element_rect(fill = 'white', colour = 'lightgrey', size = 0.5, linetype = "solid"), 
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "lightgrey"),
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "lightgrey"),# Background of the entire plot
    legend.position="right",)

plot_berlin_all_years <- ggplot(data = Air_Berlin,
       mapping = aes(y = AQI,
                     x = date
       )) +
  geom_line(color="darkblue")+
  geom_smooth(color="red")+
  ggtitle("Air Quality Index Berlin")+
  theme(
    panel.background = element_rect(fill = 'white', colour = 'lightgrey', size = 0.5, linetype = "solid"), 
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "lightgrey"),
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "lightgrey"),# Background of the entire plot
    legend.position="right",)

plot_milano_all_years <- ggplot(data = Air_Milano,
       mapping = aes(y = AQI,
                     x = date
       )) +
  geom_line(color="darkblue")+
  geom_smooth(color="red")+
  ggtitle("Air Quality Index Milano")+
  theme(
    panel.background = element_rect(fill = 'white', colour = 'lightgrey', size = 0.5, linetype = "solid"), 
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "lightgrey"),
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "lightgrey"),# Background of the entire plot
    legend.position="right",)

plot_wuhan_all_years <- ggplot(data = Air_Wuhan,
       mapping = aes(y = AQI,
                     x = date
       )) +
  geom_line(color="darkblue")+
  geom_smooth(color="red")+
  ggtitle("Air Quality Index Wuhan")+
  theme(
    panel.background = element_rect(fill = 'white', colour = 'lightgrey', size = 0.5, linetype = "solid"), 
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "lightgrey"),
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "lightgrey"),# Background of the entire plot
    legend.position="right",)


#Plot since 2019

AQI20_Beijing=subset(Air_Beijing, year(Air_Beijing$date) %in% c("2020","2019"))
AQI20_Berlin=subset(Air_Berlin, year(Air_Berlin$date) %in%  c("2020","2019"))
AQI20_Milano=subset(Air_Milano, year(Air_Milano$date) %in%  c("2020","2019"))
AQI20_NY=subset(Air_NY, year(Air_NY$date) %in%  c("2020","2019"))
AQI20_Wuhan=subset(Air_Wuhan, year(Air_Wuhan$date) %in%  c("2020","2019"))


plot_bejing_2019 <- ggplot(data = AQI20_Beijing,
       mapping = aes(y = AQI,
                     x = date
       )) +
  geom_line(color="darkblue")+
  geom_smooth(color="red")+
  ggtitle("Air Quality Index Beijing")+
  theme(
    panel.background = element_rect(fill = 'white', colour = 'lightgrey', size = 0.5, linetype = "solid"), 
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "lightgrey"),
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "lightgrey"),# Background of the entire plot
    legend.position="right",)

plot_berlin_2019 <- ggplot(data = AQI20_Berlin,
       mapping = aes(y = AQI,
                     x = date
       )) +
  geom_line(color="darkblue")+
  geom_smooth(color="red")+
  ggtitle("Air Quality Index Berlin")+
  theme(
    panel.background = element_rect(fill = 'white', colour = 'lightgrey', size = 0.5, linetype = "solid"), 
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "lightgrey"),
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "lightgrey"),# Background of the entire plot
    legend.position="right",)

plot_milano_2019<- ggplot(data = AQI20_Milano,
       mapping = aes(y = AQI,
                     x = date
       )) +
  geom_line(color="darkblue")+
  geom_smooth(color="red")+
  ggtitle("Air Quality Index Milano")+
  theme(
    panel.background = element_rect(fill = 'white', colour = 'lightgrey', size = 0.5, linetype = "solid"), 
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "lightgrey"),
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "lightgrey"),# Background of the entire plot
    legend.position="right",)

plot_wuhan_2019 <- ggplot(data = AQI20_Wuhan,
       mapping = aes(y = AQI,
                     x = date
       )) +
  geom_line(color="darkblue")+
  geom_smooth(color="red")+
  ggtitle("Air Quality Index Wuhan")+
  theme(
    panel.background = element_rect(fill = 'white', colour = 'lightgrey', size = 0.5, linetype = "solid"), 
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "lightgrey"),
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "lightgrey"),# Background of the entire plot
    legend.position="right",)

#Plots Januar-März
AQI20_Beijing20=subset(Air_Beijing, year(Air_Beijing$date) %in% "2020")
AQI20_Beijing19=subset(Air_Beijing, year(Air_Beijing$date) %in% "2019")
AQI20_Beijing19_123=subset(AQI20_Beijing19, !month(AQI20_Beijing19$date) %in% c("4","5","6","7","8","9","10","11","12"))
AQI20_Beijing18=subset(Air_Beijing, year(Air_Beijing$date) %in% "2018")
AQI20_Beijing18_123=subset(AQI20_Beijing18, !month(AQI20_Beijing18$date) %in% c("4","5","6","7","8","9","10","11","12"))

AQI20_Wuhan20=subset(Air_Wuhan, year(Air_Wuhan$date) %in% "2020")
AQI20_Wuhan19=subset(Air_Wuhan, year(Air_Wuhan$date) %in% "2019")
AQI20_Wuhan19_123=subset(AQI20_Wuhan19, !month(AQI20_Wuhan19$date) %in% c("4","5","6","7","8","9","10","11","12"))
AQI20_Wuhan18=subset(Air_Wuhan, year(Air_Wuhan$date) %in% "2018")
AQI20_Wuhan18_123=subset(AQI20_Wuhan18, !month(AQI20_Wuhan18$date) %in% c("4","5","6","7","8","9","10","11","12"))


AQI20_Berlin20=subset(Air_Berlin, year(Air_Berlin$date) %in% "2020")
AQI20_Berlin19=subset(Air_Berlin, year(Air_Berlin$date) %in% "2019")
AQI20_Berlin19_123=subset(AQI20_Berlin19, !month(AQI20_Berlin19$date) %in% c("4","5","6","7","8","9","10","11","12"))
AQI20_Berlin18=subset(Air_Berlin, year(Air_Berlin$date) %in% "2018")
AQI20_Berlin18_123=subset(AQI20_Berlin18, !month(AQI20_Berlin18$date) %in% c("4","5","6","7","8","9","10","11","12"))


AQI20_Milano20=subset(Air_Milano, year(Air_Milano$date) %in% "2020")
AQI20_Milano19=subset(Air_Milano, year(Air_Milano$date) %in% "2019")
AQI20_Milano19_123=subset(AQI20_Milano19, !month(AQI20_Milano19$date) %in% c("4","5","6","7","8","9","10","11","12"))
AQI20_Milano18=subset(Air_Milano, year(Air_Milano$date) %in% "2018")
AQI20_Milano18_123=subset(AQI20_Milano18, !month(AQI20_Milano18$date) %in% c("4","5","6","7","8","9","10","11","12"))

plot_jan_mar_bejing <- ggplot() +
  geom_smooth(data = AQI20_Beijing20, aes(x = date, y = AQI, color = "2020")) +
  geom_smooth(data = AQI20_Beijing19_123, aes(x = (date + 1*365), y = AQI, color = "2019")) +
  geom_smooth(data = AQI20_Beijing18_123, aes(x = (date + 2*365), y = AQI, color = "2018")) +
  xlab('Dates') +
  ylab('AQI')+
  ggtitle("Air Quality Index Beijing")+
  scale_colour_manual(name="Legend", values=c("orange", "red", "blue"))+
  theme(
    panel.background = element_rect(fill = 'white', colour = 'lightgrey', size = 0.5, linetype = "solid"), 
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "lightgrey"),
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "lightgrey"),# Background of the entire plot
    legend.position="right",)



plot_jan_mar_wuhan <- ggplot() +
  geom_smooth(data = AQI20_Wuhan20, aes(x = date, y = AQI, color = "2020")) +
  geom_smooth(data = AQI20_Wuhan19_123, aes(x = (date + 1*365), y = AQI, color = "2019")) +
  geom_smooth(data = AQI20_Wuhan18_123, aes(x = (date + 2*365), y = AQI, color = "2018")) +
  xlab('Dates') +
  ylab('AQI')+
  ggtitle("Air Quality Index Wuhan")+
  scale_colour_manual(name="Legend", values=c("orange", "red", "blue"))+
  theme(
    panel.background = element_rect(fill = 'white', colour = 'lightgrey', size = 0.5, linetype = "solid"), 
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "lightgrey"),
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "lightgrey"),# Background of the entire plot
    legend.position="right",)




plot_jan_mar_berlin <- ggplot() +
  geom_smooth(data = AQI20_Berlin20, aes(x = date, y = AQI, color = "2020")) +
  geom_smooth(data = AQI20_Berlin19_123, aes(x = (date + 1*365), y = AQI, color = "2019")) +
  geom_smooth(data = AQI20_Berlin18_123, aes(x = (date + 2*365), y = AQI, color = "2018")) +
  xlab('Dates') +
  ylab('AQI')+
  ggtitle("Air Quality Index Berlin")+
  scale_colour_manual(name="Legend", values=c("orange", "red", "blue"))+
  theme(
    panel.background = element_rect(fill = 'white', colour = 'lightgrey', size = 0.5, linetype = "solid"), 
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "lightgrey"),
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "lightgrey"),# Background of the entire plot
    legend.position="right",)




plot_jan_mar_milano <- ggplot() +
  geom_smooth(data = AQI20_Milano20, aes(x = date, y = AQI, color = "2020")) +
  geom_smooth(data = AQI20_Milano19_123, aes(x = (date + 1*365), y = AQI, color = "2019")) +
  geom_smooth(data = AQI20_Milano18_123, aes(x = (date + 2*365), y = AQI, color = "2018")) +
  xlab('Dates') +
  ylab('AQI')+
  ggtitle("Air Quality Index Milano")+
  scale_colour_manual(name="Legend", values=c("orange", "red", "blue"))+
  theme(
    panel.background = element_rect(fill = 'white', colour = 'lightgrey', size = 0.5, linetype = "solid"), 
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "lightgrey"),
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "lightgrey"),# Background of the entire plot
    legend.position="right",)





