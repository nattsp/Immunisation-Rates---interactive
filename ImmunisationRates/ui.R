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
            h3("Choose which vaccinations to see"),
            
            radioButtons("vacc", "Vaccine to compare with total:",
                         c("Diphtheria, tetanus and pertussis (whooping cough)" = "PCT_DTP",
                           "Polio" = "PCT_Polio",
                           "Haemophilus influenzae type b (causes meningitis)" = "PCT_HIB",
                           "Hepatitis" = "PCT_HEP",
                           "Measles-mumps-rubella vaccine" = "PCT_MMR",
                           "Pneumonia (lung infection) " = "PCT_Pneumo",
                           "Meningococcal C" = "PCT_MenC",
                           "Varicella (chickenpox)" = "PCT_Varicella"))
        ),
        
        # Show plot of immunisation rates
        
        mainPanel(
            h2("Vaccination rates"),
            
            plotOutput('distPlot'),
            
            plotOutput('distPlot2')
        )
    )
))