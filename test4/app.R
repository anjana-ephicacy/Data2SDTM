library(shiny)

ui <- navbarPage(

  title = "Clinical Dashboard",

  tabPanel(
    "Home",
    h3("Welcome")
  ),

  navbarMenu(
    "Patient Profile",

    tabPanel(
      "Overview",
      h3("Patient Overview")
    ),

    tabPanel(
      "Demographics",
      h3("Demographics Data")
    ),

    tabPanel(
      "Medical History",
      h3("Medical History")
    )
  ),

  navbarMenu(
    "Reports",

    tabPanel(
      "Generate Report",
      h3("Generate PDF/HTML Reports")
    ),

    tabPanel(
      "Report History",
      h3("Previously Generated Reports")
    )
  ),

  navbarMenu(
    "Settings",

    tabPanel(
      "User Preferences",
      h3("User Settings")
    ),

    tabPanel(
      "Application Configuration",
      h3("Configuration")
    )
  )
)

server <- function(input, output, session) {}

shinyApp(ui, server)
