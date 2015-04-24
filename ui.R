library(shiny)

shinyUI(fluidPage(
    
   titlePanel("Fuel Efficiency"),
    
     sidebarLayout(
         sidebarPanel(
             helpText("Please choose the type of transmission and the 
                        1/4 mile time you want."),
             helpText("The result is the fuel efficiency of your car 
                      (Miles/gallon). Which will be in the plot at right side of
                        this page and the text below that plot."),
             
             selectInput("transmission", 
                         label = "Choose the tranmission type of the car",
                         choices = list("Automatic" = 0, "Manual" = 1),
                         selected = 0),
             
             sliderInput("qmiletime", 
                         label = "1/4 mile time (unit: second)",
                         min = 14.5, max = 23, 
                         value = 14.5, step = 0.5)
         ),
         
         mainPanel(
             
             plotOutput('plot1'),
             
             textOutput("text3")
             )
     )
))