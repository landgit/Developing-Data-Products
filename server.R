# server.R
library(shiny)
cardata <- readRDS("data/mtcars")
library(ggplot2)

mpgg <- function(am, qmile) {
    -18.88+8.87*as.numeric(am)+
    1.98*as.numeric(qmile)
}

shinyServer(
    function(input, output) {
        
        newcardata <- reactive({
            #as.data.frame(cardata)
            cardata[33,1] <- -18.88+8.87*as.numeric(input$transmission)+
                1.98*as.numeric(input$qmiletime)
            cardata[33,2] <- as.numeric(input$qmiletime)
            cardata[33,3] <- as.numeric(input$transmission)
            cardata[33,4] <- 1
            as.data.frame(cardata)
            
            
        })
        
        output$plot1 <- renderPlot({
            ggplot(newcardata(), 
                   aes(x = qsec, y = mpg, colour = factor(V4) )) + 
                geom_point() + xlab("1/4 mile time (unit: second)") +
                ylab("Miles/(US) gallon")+ scale_color_discrete(
                    name="",
                    breaks=c("0", "1"),
                    labels=c("cars from data", "your car")
                    )
            
        })
        
        
        
        output$text3 <- renderText({ 
            paste("The predicted Miles/(US) gallon of your car will be:", 
                  mpgg(input$transmission, input$qmiletime))
        })
    }
)