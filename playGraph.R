plot(immDataAll$PCT_Fully,immDataAll$PCT_DTP)

library(dplyr)
library(tidyr)
library(zoo)
library(xts)
library(dygraphs)

vaccTime <- immDataAll %>%
    group_by(Time_Period) %>%
    summarise(AveVacRate=mean(PCT_Fully))
head(vaccTime)

vaccTS <- xts(vaccTime[,2], order.by = vaccTime$Time_Period)
plot(vaccTS)


vaccTime <- immDataAll %>%
    select(contains("Date") | contains("Fully"))
head(vaccTime)

immDataLong <- immDataAll %>%
    gather(Time_Period, "Percent", 4:12)
head(immDataLong)
