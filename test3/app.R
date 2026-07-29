library(shiny)
library(DT)

ui <- navbarPage(

  title = "Clinical Dashboard",

  # Home Tab
  tabPanel(
    "Home",

    fluidPage(
      h3("Welcome to Clinical Dashboard")
    )
  ),

  # Patient Profile Tab
  tabPanel(
    "Patient Profile",

    sidebarLayout(

      sidebarPanel(
        selectInput(
          "study",
          "Study",
          choices = c("Study 1", "Study 2")
        ),

        selectInput(
          "subject",
          "Subject",
          choices = c("SUBJ001", "SUBJ002")
        )
      ),

      mainPanel(
        h3("Patient Profile"),
        plotOutput("patient_plot")
      )
    )
  ),

  # Reports Tab
  tabPanel(
    "Reports",

    sidebarLayout(

      sidebarPanel(
        textInput("title", "Report Title"),
        numericInput("width", "Width", 800),
        numericInput("height", "Height", 600)
      ),

      mainPanel(
        h3("Report Generator"),
        actionButton("generate", "Generate Report")
      )
    )
  ),

  # Settings Tab
  tabPanel(
    "Settings",

    fluidPage(
      h3("Application Settings")
    )
  )
)

server <- function(input, output, session) {

  output$patient_plot <- renderPlot({
    plot(mtcars$wt, mtcars$mpg)
  })

}

shinyApp(ui, server)
