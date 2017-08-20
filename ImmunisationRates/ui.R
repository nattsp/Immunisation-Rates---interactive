#
# Shiny application for Immunisation Rates
# 
#    https://nattsapps.shinyapps.io/ImmunisationRates/
#
# Natalie Phillips
#

library(shiny)
shinyUI(fluidPage(
    titlePanel("Immunisations Rates for in Australia"),
    sidebarLayout(
        sidebarPanel(
            h3("Choose which vaccinations to see")
        ),
        
        # Show plot of immunisation rates
        
        mainPanel(
            h2("Vaccination rates"),
            
            plotOutput('distPlot'),
            
            plotOutput('distPlot2')
        )
    )
))