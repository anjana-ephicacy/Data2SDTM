library(shiny)
library(bs4Dash)

ui <- dashboardPage(

  header = dashboardHeader(
    title = "Patient Profile"
  ),

  sidebar = dashboardSidebar(

    sidebarMenu(
      menuItem(
        text = "Dashboard",
        tabName = "dashboard",
        icon = icon("dashboard")
      ),

      menuItem(
        text = "Patient Profile",
        tabName = "patient",
        icon = icon("user")
      )
    )
  ),

  body = dashboardBody(

    tabItems(

      tabItem(
        tabName = "dashboard",

        fluidRow(
          bs4Card(
            title = "Dashboard Summary",
            width = 12,
            status = "primary",
            "Dashboard Content"
          )
        )
      ),

      tabItem(
        tabName = "patient",

        fluidRow(
          bs4Card(
            title = "Patient Information",
            width = 12,
            status = "success",
            "Patient Profile Content"
          )
        )
      )

    )
  )
)

server <- function(input, output, session) {}

shinyApp(ui, server)
