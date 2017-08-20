plot(immDataAll$PCT_Fully,immDataAll$PCT_DTP)

library(dplyr)
library(tidyr)
library(zoo)
library(xts)
library(dygraphs)
library(ggplot2)

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
    gather("Vaccination", "Percent", 4:12)
head(immDataLong)

immDataRegion <- immDataLong %>%
    filter(Age_Group == "60-<63 Months") %>%
    mutate(Region_Type = paste(PHN_Name,Vaccination, sep = "_")) %>%
    select(c(Region_Type, Time_Period, Percent)) %>%
    filter(grepl('Fully', Region_Type))
    
head(immDataRegion)
immRegionTS <- xts(immDataRegion[,c(1,3)], immDataRegion$Time_Period)
head(immRegionTS)

ggplot(immDataRegion, aes(x=Time_Period, y=Percent, 
                        colour = Region_Type, group=Region_Type)) +
    geom_line()
