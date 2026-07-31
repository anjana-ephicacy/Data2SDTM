

library(shiny)
library(bs4Dash)

ui <- bs4DashPage(

  header = bs4DashNavbar(
    skin = "maroon",

    brand = dashboardBrand(
      title = "Data2SDTM Application",
      color = "navy"
    ),

    bs4Dash::navbarMenu(
      id ="input_menus",
      navbarTab(tabName = "upload_data_tab",text = "Upload Data"),
      navbarTab(tabName = "generate_tab",text = "Generate")
    )

  ),

  sidebar = bs4DashSidebar(
    disable = TRUE
  ),

  body = bs4DashBody(

    h2("Welcome to Data2SDTM"),
    p("another text")

  ),

  controlbar = bs4DashControlbar(disable = TRUE)
)

server <- function(input, output, session) {}

shinyApp(ui, server)
