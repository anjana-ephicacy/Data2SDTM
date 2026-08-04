#loading libraries

library(shiny)
library(bs4Dash)

#loading the modules

source("R/report_generation.R")
source("R/upload_data.R")

#Start of the ui

ui <- bs4DashPage(

  header = bs4DashNavbar(
    # skin = "maroon",

    brand = dashboardBrand(
      title = "Data2SDTM Application"
      # color = "navy"
    ),

    bs4Dash::navbarMenu(
      id ="input_menus",
      navbarTab(tabName = "upload_data_tab",text = "Upload Data"
                ),
      navbarTab(tabName = "generate_tab",text = "Generate")
    )

  ),

  sidebar = bs4DashSidebar(
    disable = TRUE
  ),

  body = bs4DashBody(
    tags$head(
      shiny::includeCSS("~/Ephicacy/Data2SDTM/Data2SDTM/SDTM_Dynamic_app/www/main.css")
    ),
    bs4TabItems(
      bs4TabItem(
        tabName = "upload_data_tab",
        upload_data_ui("upload_id")
      ),

      bs4TabItem(
        tabName = "generate_tab",
        h2("Welcome to Generate Tab")

      )
    ),



  ),

  controlbar = bs4DashControlbar(disable = TRUE)
)

#Start of the server

server <- function(input, output, session) {
  upload_data_server("upload_id")
}

shinyApp(ui, server)
