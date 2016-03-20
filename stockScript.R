ibm_url <- "http://real-chart.finance.yahoo.com/table.csv?s=IBM&a=07&b=24&c=2010&d=07&e=24&f=2015&g=d&ignore=.csv"
fileURL <- "http://finance.yahoo.com/d/quotes.csv?s=AAPL&f=nd1l1va2j1rt8m3m4ykj"

fileURL <-paste("http://finance.yahoo.com/d/quotes.csv?s=",sym,"&f=snd1l1va2j1rt8m3m4ykj",sep = "")
urlSet<-paste("http://finance.yahoo.com/d/quotes.csv?s=",ReadTickerList,"&f=snd1l1va2j1rt8m3m4ykj",sep = "")
c("Name","LastDate","Close","volume","avgVol","marketCap","PE","1YrTarget","50DaySMA","200DaySMA", "dividendYield","52WeekHigh","52WeekLow")

stockQuote <-read.csv(fileURL,header = FALSE)
names(stockQuote) <- c("Name","LastDate","Close","volume","avgVol","marketCap","PE","1YrTarget","50DaySMA","200DaySMA", "dividendYield","52WeekHigh","52WeekLow")

cbind(sym,stockQuote)

stockTable <-data.frame()
stockDT <- data.table()
for (i in ReadTickerList)
{ fileURL <-paste("http://finance.yahoo.com/d/quotes.csv?s=",i,"&f=snd1l1va2j1rt8m3m4ykj",sep = "")
  stockQuote <-read.csv(fileURL,header = FALSE)
  names(stockQuote) <- c("Ticker","Name","LastDate","Close","volume","avgVol","marketCap","PE","1YrTarget","50DaySMA","200DaySMA", "dividendYield","52WeekHigh","52WeekLow")
  stockTable<-rbind(stockTable,stockQuote)
  print(i)
  }

stockList <-read.csv("./R/CompanylistNYSE.csv")
stocksFinal$MarketCap[stocksFinal$MarketCap>2000000000]
ReadTickerList <- stocksFinal$Symbol[stocksFinal$MarketCap>2000000000]


library(data.table)  
files <- list.files(path = "/etc/dump",pattern = ".csv")
temp <- lapply(urlSet, fread, sep=",")
data <- rbindlist( temp )