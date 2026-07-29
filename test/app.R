#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

library(bs4Dash)

ui <- dashboardPage(
  header = dashboardHeader(),
  sidebar = dashboardSidebar(
    fileInput("csv_file","upload")
  ),
  body = dashboardBody(

    bs4Card(
      title = "Patient Information",
      width = 12,
      status = "primary",
      solidHeader = TRUE,

      p("Patient Profile Content"),
      DT::DTOutput("distPlot")
    )

  )
)




library(DT)

server <- function(input, output, session) {

  data <- reactive({

    req(input$csv_file)

    read.csv(
      input$csv_file$datapath,
      stringsAsFactors = FALSE
    )

  })

  output$distPlot <- renderDT({
    datatable(
      data(),
      filter = "top",
      options = list(scrollX = TRUE)
    )
  })

}


# Run the application
shinyApp(ui = ui, server = server)
