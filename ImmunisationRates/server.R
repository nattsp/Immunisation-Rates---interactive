#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#

library(shiny)



# Logic for drawing plot
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({

        plot(immDataAll$PCT_DTP, immDataAll$PCT_Fully)
        
    })
    
    output$distPlot2 <- renderPlot({
        ggplot(immDataRegion, aes(x=Time_Period, y=Percent, 
                                  colour = Region_Type, group=Region_Type)) +
            geom_line()
    })
})