#
# Shiny application for Immunisation Rates
# 
#    https://nattsapps.shinyapps.io/ImmunisationRates/
#
# Natalie Phillips
#

library(shiny)
shinyUI(fluidPage(
    titlePanel("Immunisations Rates for Australia"),
    sidebarLayout(
        sidebarPanel(
            h3("Plot 1"),
            h3("Choose which vaccinations to see"),
            
            p("Some vaccinations are more closely aligned with the total vaccination
              rate than others. Ignoring time and region you have a choice of vaccinate
              rates to compare to total vaccination rates in Australia."),
            
            p("Choose from one of the 8 seperate vaccinations that are tracked:"),
            
            radioButtons("vacc", "Vaccine to compare with total:",
                         c("Diphtheria, tetanus and pertussis (whooping cough)" = "PCT_DTP",
                           "Polio" = "PCT_Polio",
                           "Haemophilus influenzae type b (causes meningitis)" = "PCT_HIB",
                           "Hepatitis" = "PCT_HEP",
                           "Measles-mumps-rubella vaccine" = "PCT_MMR",
                           "Pneumonia (lung infection) " = "PCT_Pneumo",
                           "Meningococcal C" = "PCT_MenC",
                           "Varicella (chickenpox)" = "PCT_Varicella")),
            
            h3("Plot 2"),
            
            h3("Changing rate of fully vaccinated children across Australia"),
            
            p("Vaccination rates vary across time. The second plot shows a time series analysis
              of different regions in Australia and their changing vaccination rates. This graph
              is not interactive however I hope it is informative none the less."),
            
            p("The second plot looks better if you have a big screen available.")
        ),
        
        # Show plot of immunisation rates
        
        mainPanel(
            h2("Vaccination rates"),
            
            plotOutput('distPlot'),
            
            plotOutput('distPlot2')
        )
    )
))