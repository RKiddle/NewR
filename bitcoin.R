#install.packages('prophet')

library(prophet)
library(tidyverse)

bitcoin <- read.csv(file.choose())
head(bitcoin)  # Display the first few rows
tail(bitcoin)  # Display the last few rows

Model1 <- prophet(bitcoin)
Future1 <- make_future_dataframe(Model1, periods = 31)

Forecast1 <- predict(Model1, Future1)
tail(Forecast1[c('ds', 'yhat', 'yhat_lower', 'yhat_upper')])

dyplot.prophet(Model1, Forecast1)
