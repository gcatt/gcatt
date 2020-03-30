# Loading required package
#install.packages("quantmod")
library(quantmod)
library(ggplot2)

### Zoom Video Communications
prices_zoom <- NULL
tickers_index <- c("ZM")

for (Ticker in tickers_index){
  prices_zoom <- cbind(prices_zoom,
                  getSymbols.yahoo(Ticker, from="2020-01-01", periodicity = "daily",
                                   auto.assign=FALSE)[,6])
}

### Microsoft

prices_microsoft <- NULL
tickers_index <- c("MSFT")

for (Ticker in tickers_index){
  prices_microsoft <- cbind(prices_microsoft,
                  getSymbols.yahoo(Ticker, from="2020-03-01", periodicity = "daily",
                                   auto.assign=FALSE)[,6])
}


### Amazon
prices_amazon <- NULL
tickers_index <- c("AMZN")

for (Ticker in tickers_index){
  prices_amazon <- cbind(prices_amazon,
                  getSymbols.yahoo(Ticker, from="2020-03-01", periodicity = "daily",
                                   auto.assign=FALSE)[,6])
}


### JP Morgan Chase
prices_jpmorgan <- NULL
tickers_index <- c("JPM")

for (Ticker in tickers_index){
  prices_jpmorgan <- cbind(prices_jpmorgan,
                  getSymbols.yahoo(Ticker, from="2020-03-01", periodicity = "daily",
                                   auto.assign=FALSE)[,6])
}



#

### Slack

prices_slack <- NULL
tickers_index <- c("WORK")

for (Ticker in tickers_index){
  prices_slack <- cbind(prices_slack,
                        getSymbols.yahoo(Ticker, from="2018-01-01", periodicity = "daily",
                                         auto.assign=FALSE)[,6])
}



#prices_exxon <-data.frame(date=index(prices_exxon), coredata(prices_exxon))
#prices_slack <- data.frame(date=index(prices_slack), coredata(prices_slack))

colnames(prices_slack)<-"Price"

colnames(prices_zoom)<-"ZM.Adjusted"
colnames(prices_amazon)<-"AMZN.Adjusted"
colnames(prices_microsoft)<-"MSFT.Adjusted"
colnames(prices_jpmorgan)<- "JPM.Adjusted"


plot_zoom <- ggplot()+
  geom_line(data=prices_zoom, aes(x=Index, y=ZM.Adjusted, color="Zoom"), size=1.5)+
  ylab("Stock price in $")+
  xlab("Date")+
  scale_colour_manual(name="Legend", values=c("red", "green", "blue", "yellow", "black", "violet"))



plot_slack <- ggplot()+
  geom_line(data=prices_slack, aes(x=Index, y= Price, color="Slack" ), size=1.5)+
  ylab("Stock price in $")+
  xlab("Date")+
  scale_colour_manual(name="Legend", values=c("red", "green", "blue", "yellow", "black", "violet"))

