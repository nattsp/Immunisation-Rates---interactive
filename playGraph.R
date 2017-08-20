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


####### map vaccines with total

names(immDataAll)

vacc <- c('PCT_DTP')



    if (vacc=='PCT_DTP'){
        plotData <- immDataAll %>% 
            select(PCT_DTP, PCT_Fully) %>%
            filter(PCT_DTP > 0)
    } else if (vacc=="PCT_Polio"){
        plotData <- immDataAll %>% 
            select(PCT_Polio, PCT_Fully) %>%
            filter(PCT_Polio > 0)
    } else if (vacc=="PCT_HIB") {
        plotData <- immDataAll %>% 
            select(PCT_HIB, PCT_Fully) %>%
            filter(PCT_HIB > 0)
    } else if (vacc=="PCT_HEP") {
        plotData <- immDataAll %>% 
            select(PCT_HEP, PCT_Fully) %>%
            filter(PCT_HEP > 0)
    } else if (vacc=="PCT_MMR") {
        plotData <- immDataAll %>% 
            select(PCT_MMR, PCT_Fully) %>%
            filter(PCT_MMR > 0)
    } else if (vacc=="PCT_Pneumo") {
        plotData <- immDataAll %>% 
            select(PCT_Pneumo, PCT_Fully) %>%
            filter(PCT_Pneumo > 0)
    } else if (vacc=="PCT_MenC") {
        plotData <- immDataAll %>% 
            select(PCT_MenC, PCT_Fully) %>%
            filter(PCT_MenC > 0)
    } else {
        plotData <- immDataAll %>% 
            select(PCT_Varicella, PCT_Fully) %>%
            filter(PCT_Varicella > 0)
    }
    names(plotData) <- "x"
    head(plotData)
