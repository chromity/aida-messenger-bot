quartile <- function(x) {
  x <- sort(x)
  n <- length(x)
  m <- (n+1)/2
  if (floor(m) != m) {
    l <- m - 1/2; 
    u <- m + 1/2;
  } else {
    l <- m - 1; 
    u <- m + 1;
  }
  c( 
     MIN = l,
     Q1 = median(x[1:l]), 
  	 Q2 = median(x[1:n]), 
  	 Q3 = median(x[u:n]), 
  	 MAX = x[n]
  	)
}

outliers <- function(x){
  outlier <- NULL
  quartile_vector <- quartile(x)
  interquartile <-  quartile_vector['Q3'] - quartile_vector['Q1']
  l <- quartile_vector['Q1'] - 1.5 * interquartile
  u <- quartile_vector['Q3'] + 1.5 * interquartile

  x <- sort(x)

  for(a in x[1:length(x)]){
    if((a < l)||(a > u)){
      outlier <- append(outlier,a)
    }
  }
  
  outlier
}


generate_matrix <- function(array,rows,columns){
  matrix_generated <- array(array,dim(c(3,3,2)));
	# for(row in 1:nrow(matrix_generated)) {
	#     for(col in 1:ncol(matrix_generated)) {
	#         matrix_generated[row, col] <- c(row,col,matrix_generated[row, col])
	#     }
	# }
}

forecaster <- function(coin,n,days){
  packages <- c("forecast")
  if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
    install.packages(setdiff(packages, rownames(installed.packages())))  
  }
  library(data.table)
  df <- fread("http://52.77.229.79/data.csv")
  factor(df$symbol)

  if(coin=="BTC"){
    fit <- arima(log(df$close[df$type=="Crypto"][df$symbol==coin]), order = c(4,1,1))
    fcast <- forecast(fit, h=days)
    df$close[df$type=="Crypto"][df$symbol==coin][n]/1000 + 0.0222  - 0.0057 * df$close[df$type=="Crypto"][df$symbol==coin][n-4]/430 + df$close[df$type=="Crypto"][df$symbol==coin][n-1]/200 - 0.0372 * df$close[df$type=="Crypto"][df$symbol==coin][n]/250 - 0.0007
  }
  else {
    fit <- lm(close ~ last_updated, data=df)
    df$close[df$type=="Crypto"][df$symbol==coin][n] - 32.43*df$close[df$type=="Crypto"][df$symbol==coin][days] + ((-1)^(days %% 2)) * 0.0372 * df$close[df$type=="Crypto"][df$symbol==coin][n-2]
  }
}

stocks <- function(days){
  packages <- c("forecast")
  if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
    install.packages(setdiff(packages, rownames(installed.packages())))  
  }
  library(data.table)
  df <- fread("http://52.77.229.79/data.csv")
  factor(df$symbol)
  tail(ma(na.omit(df$close[df$type=="Stock"]),days),n=1)
}

ma <- function(x,n=5){filter(x,rep(1/n,n), sides=2)}

bitcoin <- function(days){
  forecaster("BTC",668,days)
}

etherium <- function(days){
  forecaster("ETH",663,days)
}

bitcash <- function(days){
  forecaster("BCH",654,days)
}

returned_value <- function(initial,value){
  (value - initial)
}

housing <- function(initial,percentage, investment, days){
  if(investment=="BTC"){
    percentage * returned_value(initial,bitcoin(days))
  }
  else if(investment=="ETH"){
    percentage * returned_value(initial,etherium(days))
  }
  else if(investment=="BCH"){
    percentage * returned_value(initial,bitcash(days))    
  }

  else if(investment=="STOCKS"){
    percentage * returned_value(initial,stocks(days))
  }
}

sickness <- function(initial,percentage, investment, days){
  if(investment=="BTC"){
    percentage * returned_value(initial,bitcoin(days))
  }
  else if(investment=="ETH"){
    percentage * returned_value(initial,etherium(days))
  }
  else if(investment=="BCH"){
    percentage * returned_value(initial,bitcash(days))    
  }
  else if(investment=="STOCKS"){
    percentage * returned_value(initial,stocks(days))
  }
}

disability <- function(initial,percentage, investment, days){
  if(investment=="BTC"){
    percentage * returned_value(initial,bitcoin(days))
  }
  else if(investment=="ETH"){
    percentage * returned_value(initial,etherium(days))
  }
  else if(investment=="BCH"){
    percentage * returned_value(initial,bitcash(days))    
  }
  else if(investment=="STOCKS"){
    percentage * returned_value(initial,stocks(days))
  }
}

maternity <- function(initial,percentage, investment, days){
  if(investment=="BTC"){
    percentage * returned_value(initial,bitcoin(days))
  }
  else if(investment=="ETH"){
    percentage * returned_value(initial,etherium(days))
  }
  else if(investment=="BCH"){
    percentage * returned_value(initial,bitcash(days))    
  }
  else if(investment=="STOCKS"){
    percentage * returned_value(initial,stocks(days))
  }
}

retirement <- function(initial,percentage, investment, days){
  if(investment=="BTC"){
    percentage * returned_value(initial,bitcoin(days))
  }
  else if(investment=="ETH"){
    percentage * returned_value(initial,etherium(days))
  }
  else if(investment=="BCH"){
    percentage * returned_value(initial,bitcash(days))    
  }
  else if(investment=="STOCKS"){
    percentage * returned_value(initial,stocks(days))
  }
}

funeral <- function(initial,percentage, investment, days){
  if(investment=="BTC"){
    percentage * returned_value(initial,bitcoin(days))
  }
  else if(investment=="ETH"){
    percentage * returned_value(initial,etherium(days))
  }
  else if(investment=="BCH"){
    percentage * returned_value(initial,bitcash(days))    
  }
  else if(investment=="STOCKS"){
    percentage * returned_value(initial,stocks(days))
  }
}

death <- function(initial,percentage, investment, days){
  if(investment=="BTC"){
    percentage * returned_value(initial,bitcoin(days))
  }
  else if(investment=="ETH"){
    percentage * returned_value(initial,etherium(days))
  }
  else if(investment=="BCH"){
    percentage * returned_value(initial,bitcash(days))    
  }
  else if(investment=="STOCKS"){
    percentage * returned_value(initial,stocks(days))
  }
}

education <- function(initial,percentage, investment, days){
  if(investment=="BTC"){
    percentage * returned_value(initial,bitcoin(days))
  }
  else if(investment=="ETH"){
    percentage * returned_value(initial,etherium(days))
  }
  else if(investment=="BCH"){
    percentage * returned_value(initial,bitcash(days))    
  }
  else if(investment=="STOCKS"){
    percentage * returned_value(initial,stocks(days))
  }
}
