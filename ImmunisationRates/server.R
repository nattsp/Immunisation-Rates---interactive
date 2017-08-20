#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#

library(shiny)



# Logic for drawing plot
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({

        plot(immDataAll$PCT_DTP, immDataAll$PCT_Fully,
             ylab = "Total vaccination rate",
             
             #xlab = "Diphtheria tetanus and pertussis whooping cough")
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