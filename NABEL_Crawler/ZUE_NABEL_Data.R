library(dplyr)
library(ggplot2)

zue <- read.csv('../NABEL_Crawler/Outputs/ZUE.csv', sep = ";")

colnames(zue)

zue <- zue[complete.cases(zue),]



zue$Datum.Zeit <- as.Date(zue$Datum.Zeit, format = "%d.%m.%Y")



#TS of PM10
ts_pm10 <- ts(data=zue$PM10..ug.m3., start = 2010, end=2020, frequency = 24)
ts_pm10
decomp<-decompose(ts_pm10)
plot(decomp, xlab="Year")

##TS of CO..mg.m3
ts_co..mg.m3 <- ts(data=zue$CO..mg.m3., start = 2015, end=2020, frequency = 24)
ts_co..mg.m3
decomp<-decompose(ts_co..mg.m3)
plot(decomp, xlab="Year")

##TS of NOX
ts_nox <- ts(data = zue$NOX..ug.m3.eq..NO2., start = 2016, end = 2020, frequency = 48)
ts_nox
decomp <- decompose(ts_nox)
plot(decomp, xlab ="Year")


data <- data.frame(
  day = zue$Datum.Zeit,
  nox = zue$NOX..ug.m3.eq..NO2.
)

ts_ggplot_nox <- ggplot(data, aes(x = day, y=nox))+
  geom_line() +
  scale_x_date(limit=c(as.Date("2017-01-01"),as.Date("2020-02-11"))) +
  xlab("")

ts_ggplot_nox



#NOX
ggplot_nox <- ggplot(data =zue, aes(x = Datum.Zeit, y=NOX..ug.m3.eq..NO2., group = 1)) +
  geom_line() + 
  labs(x ="Date",
       y = "NOX",
       title ="NOX Data")
ggplot_nox


#PM10
ggplot_pm10 <- ggplot(data = zue, aes(x = Datum.Zeit, y=PM10..ug.m3., group = 1)) +
  geom_line() +
  labs(x = "Date",
       y = "PM10",
       title = "PM10 Data")
ggplot_pm10

#CO..mg.m3
ggplot_com3 <- ggplot(data = zue, aes(x = Datum.Zeit, y=CO..mg.m3., group = 1)) +
  geom_smooth() +
  labs(x = "Date",
       y = "CO mg",
       title = "CO mg Data")
ggplot_com3




