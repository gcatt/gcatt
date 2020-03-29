# Loading required package
#install.packages("quantmod")
library(quantmod)

# Downloading Prices of SMI ("^SSMI") via Yahoo Finance API
prices <- NULL
tickers_index <- c("^SSMI")

for (Ticker in tickers_index){
  prices <- cbind(prices,
                  getSymbols.yahoo(Ticker, from="2020-01-01", periodicity = "daily",
                                   auto.assign=FALSE)[,6])
}


prices_diff <- diff(prices)

plot(prices)

plot(prices_diff)


prices <- NULL
tickers_index <- c("^GSPC")

for (Ticker in tickers_index){
  prices <- cbind(prices,
                  getSymbols.yahoo(Ticker, from="2020-01-01", periodicity = "daily",
                                   auto.assign=FALSE)[,6])
}

prices_diff <- diff(prices)

prices_log <- log(prices)

plot(prices_log)

plot(prices)

plot(prices_diff)


### Zoom Video Communications
prices <- NULL
tickers_index <- c("ZM")

for (Ticker in tickers_index){
  prices <- cbind(prices,
                  getSymbols.yahoo(Ticker, from="2020-01-01", periodicity = "daily",
                                   auto.assign=FALSE)[,6])
}

prices_diff <- diff(prices)

plot(prices)

plot(prices_diff)







### Microsoft

prices <- NULL
tickers_index <- c("MSFT")

for (Ticker in tickers_index){
  prices <- cbind(prices,
                  getSymbols.yahoo(Ticker, from="2020-01-01", periodicity = "daily",
                                   auto.assign=FALSE)[,6])
}

plot(prices)

### Amazon
prices <- NULL
tickers_index <- c("AMZN")

for (Ticker in tickers_index){
  prices <- cbind(prices,
                  getSymbols.yahoo(Ticker, from="2020-03-01", periodicity = "daily",
                                   auto.assign=FALSE)[,6])
}

plot(prices)

### JP Morgan Chase
prices <- NULL
tickers_index <- c("JPM")

for (Ticker in tickers_index){
  prices <- cbind(prices,
                  getSymbols.yahoo(Ticker, from="2020-03-01", periodicity = "daily",
                                   auto.assign=FALSE)[,6])
}

plot(prices)

### EXXON
prices_exxon <- NULL
tickers_index <- c("XOM")

for (Ticker in tickers_index){
  prices_exxon <- cbind(prices,
                  getSymbols.yahoo(Ticker, from="2020-03-01", periodicity = "daily",
                                   auto.assign=FALSE)[,6])
}

### Slack

prices_slack <- NULL
tickers_index <- c("WORK")

for (Ticker in tickers_index){
  prices_slack <- cbind(prices_slack,
                        getSymbols.yahoo(Ticker, from="2020-03-01", periodicity = "daily",
                                         auto.assign=FALSE)[,6])
}

plot(prices_slack,label)
plot(prices_exxon, col = "green")
