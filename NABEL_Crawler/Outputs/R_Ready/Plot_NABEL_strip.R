#NABEL Plots

#librarys

library(ggplot2)
library(ggthemes)
library(stats)
library(lubridate)
library(sf)
library(dplyr)
library(gridExtra)

# Multiple plot function
#
# ggplot objects can be passed in ..., or to plotlist (as a list of ggplot objects)
# - cols:   Number of columns in layout
# - layout: A matrix specifying the layout. If present, 'cols' is ignored.
#
# If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
# then plot 1 will go in the upper left, 2 will go in the upper right, and
# 3 will go all the way across the bottom.
#
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  require(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}


#Read in Data
BAS<-read.csv("C:/Users/ginoc/Git_Repos/gcatt/NABEL_Crawler/Outputs/R_Ready/BAS_clean.csv",stringsAsFactors = FALSE)
BER<-read.csv("C:/Users/ginoc/Git_Repos/gcatt/NABEL_Crawler/Outputs/R_Ready/BER_clean.csv",stringsAsFactors = FALSE)
DAV<-read.csv("C:/Users/ginoc/Git_Repos/gcatt/NABEL_Crawler/Outputs/R_Ready/DAV_clean.csv",stringsAsFactors = FALSE)
LAU<-read.csv("C:/Users/ginoc/Git_Repos/gcatt/NABEL_Crawler/Outputs/R_Ready/LAU_clean.csv",stringsAsFactors = FALSE)
LUG<-read.csv("C:/Users/ginoc/Git_Repos/gcatt/NABEL_Crawler/Outputs/R_Ready/LUG_clean.csv",stringsAsFactors = FALSE)



#Convert Column 'Datum.Zeit' to Date
BAS$Datum.Zeit<-as.Date(BAS$Datum.Zeit, format = "%d.%m.%Y")
BER$Datum.Zeit<-as.Date(BER$Datum.Zeit, format = "%d.%m.%Y")
DAV$Datum.Zeit<-as.Date(DAV$Datum.Zeit, format = "%d.%m.%Y")
LAU$Datum.Zeit<-as.Date(LAU$Datum.Zeit, format = "%d.%m.%Y")
LUG$Datum.Zeit<-as.Date(LUG$Datum.Zeit, format = "%d.%m.%Y")



#Remove NA's
bas <- BAS[complete.cases(BAS),]
ber <- BER[complete.cases(BER),]
dav <- DAV[complete.cases(DAV),]
lau <- LAU[complete.cases(LAU),]
lug <- LUG[complete.cases(LUG),]





# Plotting Basel
BAS_O3<-ggplot(data = bas, mapping = aes(y = O3..ug.m3., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of O3 in Basel")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 200)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(BAS_O3)

BAS_NO2<-ggplot(data = bas, mapping = aes(y = NO2..ug.m3., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of NO2 in Basel")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 50)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(BAS_NO2)

BAS_SO2<-ggplot(data = bas, mapping = aes(y = SO2..ug.m3., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of SO2 in Basel")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 8)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(BAS_SO2)

BAS_PM10<-ggplot(data = bas, mapping = aes(y = PM10..ug.m3., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of PM10 in Basel")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 70)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(BAS_PM10)

BAS_PM2.5<-ggplot(data = bas, mapping = aes(y = PM2.5..ug.m3., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of PM2.5 in Basel")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 60)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(BAS_PM2.5)

BAS_NOX<-ggplot(data = bas, mapping = aes(y = NOX..ug.m3.eq..NO2., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of NOX in Basel")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 60)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(BAS_NOX)

BAS_TEMP<-ggplot(data = BAS, mapping = aes(y = TEMP..C., x = Datum.Zeit)) +
  geom_line(color="darkblue")+
  geom_point() +
  geom_smooth(color = 'red')+
  ggtitle("Temperature in Basel")+
  ylab("Temp")+
  xlab('')+
  ylim(-8, 30)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(BAS_TEMP)


# Plotting Bern
BER_O3<-ggplot(data = ber, mapping = aes(y = O3..ug.m3., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of O3 in Bern")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 200)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(BER_O3)

BER_NO2<-ggplot(data = ber, mapping = aes(y = NO2..ug.m3., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of NO2 in Bern")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 50)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(BER_NO2)

BER_PM10<-ggplot(data = ber, mapping = aes(y = PM10..ug.m3., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of PM10 in Bern")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 50)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(BER_PM10)

BER_PM2.5<-ggplot(data = ber, mapping = aes(y = PM2.5..ug.m3., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of PM2.5 in Bern")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 10)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(BER_PM2.5)

BER_NOX<-ggplot(data = ber, mapping = aes(y = NOX..ug.m3.eq..NO2., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of NOX in Bern")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 60)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(BER_NOX)

BER_TEMP<-ggplot(data = BER, mapping = aes(y = TEMP..C., x = Datum.Zeit)) +
  geom_line(color="darkblue")+
  geom_point() +
  geom_smooth(color = 'red')+
  ggtitle("Temperature in Bern")+
  ylab("Temp")+
  xlab('')+
  ylim(-8, 30)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(BER_TEMP)


# Plotting Davos
DAV_O3<-ggplot(data = dav, mapping = aes(y = O3..ug.m3., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of O3 in Davos")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 150)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(DAV_O3)

DAV_NO2<-ggplot(data = dav, mapping = aes(y = NO2..ug.m3., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of NO2 in Davos")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 15)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(DAV_NO2)

DAV_PM10<-ggplot(data = dav, mapping = aes(y = PM10..ug.m3., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of PM10 in Davos")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 50)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(DAV_PM10)

DAV_NOX<-ggplot(data = dav, mapping = aes(y = NOX..ug.m3.eq..NO2., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of NOX in Davos")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 20)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(DAV_NOX)

DAV_TEMP<-ggplot(data = DAV, mapping = aes(y = TEMP..C., x = Datum.Zeit)) +
  geom_line(color="darkblue")+
  geom_point() +
  geom_smooth(color = 'red')+
  ggtitle("Temperature in Davos")+
  ylab("Temp")+
  xlab('')+
  ylim(-8, 30)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(DAV_TEMP)


# Plotting Lausanne
LAU_O3<-ggplot(data = lau, mapping = aes(y = O3..ug.m3., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of O3 in Lausanne")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 170)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(LAU_O3)

LAU_NO2<-ggplot(data = lau, mapping = aes(y = NO2..ug.m3., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of NO2 in Lausanne")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 75)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(LAU_NO2)

LAU_CO<-ggplot(data = lau, mapping = aes(y = CO..mg.m3., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of CO in Lausanne")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 1)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(LAU_CO)

LAU_PM10<-ggplot(data = lau, mapping = aes(y = PM10..ug.m3., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of PM10 in Lausanne")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 50)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(LAU_PM10)

LAU_PM2.5<-ggplot(data = lau, mapping = aes(y = PM2.5..ug.m3., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of PM2.5 in Lausanne")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 40)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(LAU_PM2.5)

LAU_NOX<-ggplot(data = lau, mapping = aes(y = NOX..ug.m3.eq..NO2., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of NOX in Lausanne")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 250)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(LAU_NOX)

LAU_TEMP<-ggplot(data = LAU, mapping = aes(y = TEMP..C., x = Datum.Zeit)) +
  geom_line(color="darkblue")+
  geom_point() +
  geom_smooth(color = 'red')+
  ggtitle("Temperature in Lausanne")+
  ylab("Temp")+
  xlab('')+
  ylim(-12, 30)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(LAU_TEMP)


# Plotting Lugano
LUG_O3<-ggplot(data = lug, mapping = aes(y = O3..ug.m3., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of O3 in Lugano")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 200)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(LUG_O3)

LUG_NO2<-ggplot(data = lug, mapping = aes(y = NO2..ug.m3., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of NO2 in Lugano")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 50)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(LUG_NO2)

LUG_SO2<-ggplot(data = lug, mapping = aes(y = SO2..ug.m3., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of SO2 in Lugano")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 7)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(LUG_SO2)

LUG_CO<-ggplot(data = lug, mapping = aes(y = CO..mg.m3., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of CO in Lugano")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 0.75)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(LUG_CO)

LUG_PM10<-ggplot(data = lug, mapping = aes(y = PM10..ug.m3., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of PM10 in Lugano")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 70)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(LUG_PM10)

LUG_PM2.5<-ggplot(data = lug, mapping = aes(y = PM2.5..ug.m3., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of PM2.5 in Lugano")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 60)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(LUG_PM2.5)

LUG_NOX<-ggplot(data = lug, mapping = aes(y = NOX..ug.m3.eq..NO2., x = Datum.Zeit)) +
  geom_smooth(color="darkblue", span = 0.3, na.rm = TRUE)+
  geom_point() +
  ggtitle("Concentration of NOX in Lugano")+
  ylab("Concentration")+
  xlab('')+
  ylim(0, 60)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(LUG_NOX)

LUG_TEMP<-ggplot(data = LUG, mapping = aes(y = TEMP..C., x = Datum.Zeit)) +
  geom_line(color="darkblue")+
  geom_point() +
  geom_smooth(color = 'red')+
  ggtitle("Temperature in Lugano")+
  ylab("Temp")+
  xlab('')+
  ylim(-8, 30)+
  theme_minimal()+
  scale_x_date(limit=c(as.Date("2019-01-01"),as.Date("2020-03-28")))  
plot(LUG_TEMP)



multiplot(BAS_O3, BAS_NO2, BAS_PM10, BAS_SO2, BAS_PM2.5, BAS_NOX, BAS_TEMP,cols=2)
multiplot(BER_O3, BER_NO2, BER_PM10, BER_PM2.5, BER_NOX, BER_TEMP,cols=2)
multiplot(DAV_O3, DAV_NO2, DAV_PM10, DAV_NOX, DAV_TEMP,cols=2)
multiplot(LAU_O3, LAU_NO2, LAU_CO, LAU_PM10, LAU_PM2.5, LAU_NOX, LAU_TEMP,cols=2)
multiplot(LUG_O3, LUG_NO2, LUG_SO2, LUG_CO, LUG_PM10, LUG_PM2.5, LUG_NOX, LUG_TEMP,cols=2)