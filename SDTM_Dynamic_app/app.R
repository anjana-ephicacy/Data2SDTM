
#loading libraries

library(shiny)

library(bslib)
#loading the modules

source("R/report_generation.R")
source("R/upload_data.R")

#Start of the ui



ui <- page_navbar(

  title = div(
    class = "app-logo",
    "Data2SDTM"
  ),

  header = tags$head(
    includeCSS("www/main.css")
  ),

  nav_panel(

    "Home",
    upload_data_ui("upload_id")


  ),

  nav_panel(
    "Settings",

    card(
      card_header("Application Settings"),

      card_body(
        checkboxInput(
          "debug",
          "Debug Mode"
        )
      )
    )
  )
)

server <- function(input, output, session) {
  upload_data_server("upload_id")
}

shinyApp(ui, server)
