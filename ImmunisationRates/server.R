#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#

library(shiny)
library(dplyr)



# Logic for drawing plot
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({
        
        if (input$vacc=='PCT_DTP'){
            plotData <- immDataAll %>% 
                select(PCT_DTP, PCT_Fully) %>%
                filter(PCT_DTP > 0)
        } else if (input$vacc=="PCT_Polio"){
            plotData <- immDataAll %>% 
                select(PCT_Polio, PCT_Fully) %>%
                filter(PCT_Polio > 0)
        } else if (input$vacc=="PCT_HIB") {
            plotData <- immDataAll %>% 
                select(PCT_HIB, PCT_Fully) %>%
                filter(PCT_HIB > 0)
        } else if (input$vacc=="PCT_HEP") {
            plotData <- immDataAll %>% 
                select(PCT_HEP, PCT_Fully) %>%
                filter(PCT_HEP > 0)
        } else if (input$vacc=="PCT_MMR") {
            plotData <- immDataAll %>% 
                select(PCT_MMR, PCT_Fully) %>%
                filter(PCT_MMR > 0)
        } else if (input$vacc=="PCT_Pneumo") {
            plotData <- immDataAll %>% 
                select(PCT_Pneumo, PCT_Fully) %>%
                filter(PCT_Pneumo > 0)
        } else if (input$vacc=="PCT_MenC") {
            plotData <- immDataAll %>% 
                select(PCT_MenC, PCT_Fully) %>%
                filter(PCT_MenC > 0)
        } else {
            plotData <- immDataAll %>% 
                select(PCT_Varicella, PCT_Fully) %>%
                filter(PCT_Varicella > 0)
        }
        names(plotData)[1] <- "x"

        #plot(immDataAll$PCT_DTP, immDataAll$PCT_Fully,
        plot(plotData$x,
             plotData$PCT_Fully,
             
             main="Total vaccination rate against individual vaccinations",
             ylab = "Total vaccination rate",
             
             xlab = if (input$vacc=='PCT_DTP'){
                 xlab = "Diphtheria tetanus and pertussis whooping cough"
             } else if (input$vacc=="PCT_Polio"){
                 xlab = "Polio"
             } else if (input$vacc=="PCT_HIB") {
                 xlab = "Haemophilus influenzae type b causes meningitis"
             } else if (input$vacc=="PCT_HEP") {
                 xlab = "Hepatitis"
             } else if (input$vacc=="PCT_MMR") {
                 xlab = "Measles-mumps-rubella vaccine"
             } else if (input$vacc=="PCT_Pneumo") {
                 xlab = "Pneumonia lung infection"
             } else if (input$vacc=="PCT_MenC") {
                 xlab = "Meningococcal C"
             } else {
                 xlab = "Varicella chickenpox"
             } 
             )
        
    })
    
    output$distPlot2 <- renderPlot({
        ggplot(immDataRegion, aes(x=Time_Period, y=Percent, 
                                  colour = Region_Type, group=Region_Type)) +
            geom_line()
    })
})