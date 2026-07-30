# #Loading the libraries
#
# library(shiny)
# library(DT)
# library(bs4Dash)
# library(bslib)
# ui <- navbarPage(
#   title = "Data2SDTM Application ",
#
#
#   # Home Tab
#   tabPanel("Home",
#
#            fluidPage(
#              p(
#                "A modern clinical data standardization platform that converts raw clinical data into SDTM datasets and actionable insights through automation, visualization, and reporting."
#              ),
#
#
#              card(
#                card_header("Select Domains"),
#                "Dashboard Content"
#              ),
#
#              box(
#                title = "Select the Data box",
#                sliderInput("slider", "Number of observations:", 1, 100, 50)
#              ),
#              fluidRow(
#              bs4Card(
#                title = "select domains",
#                width = 12,
#                status = "primary",
#                "Dashboard Content"
#              ))
#
#            )),
#
#   # Patient Profile Tab
#   tabPanel("Patient Profile",
#
#            sidebarLayout(
#              sidebarPanel(
#                selectInput("study",
#                            "Study",
#                            choices = c("Study 1", "Study 2")),
#
#                selectInput("subject",
#                            "Subject",
#                            choices = c("SUBJ001", "SUBJ002"))
#              ),
#
#              mainPanel(h3("Patient Profile"),
#                        plotOutput("patient_plot"))
#            )),
#
#   # Reports Tab
#   tabPanel("Reports",
#
#            sidebarLayout(
#              sidebarPanel(
#                textInput("title", "Report Title"),
#                numericInput("width", "Width", 800),
#                numericInput("height", "Height", 600)
#              ),
#
#              mainPanel(
#                h3("Report Generator"),
#                actionButton("generate", "Generate Report")
#              )
#            )),
#
#   # Settings Tab
#   tabPanel("Settings",
#
#            fluidPage(h3(
#              "Application Settings"
#            )))
# )
#
# server <- function(input, output, session) {
#   output$patient_plot <- renderPlot({
#     plot(mtcars$wt, mtcars$mpg)
#   })
#
# }
#
# shinyApp(ui = ui, server = server)





ui <- dashboardPage(
  header = dashboardHeader(
    title = "Data2SDTM"
  ),

  sidebar = dashboardSidebar(),

  body = dashboardBody(

    fluidRow(

      tabPanel(
        "Home",

        fluidPage(

          div(
            class = "card",

            div(
              class = "card-header",
              "Select Data"
            ),

            div(
              class = "card-body",

              sliderInput(
                "slider",
                "Number of observations:",
                1,
                100,
                50
              )
            )
          ),

          br(),

          div(
            class = "card",

            div(
              class = "card-header",
              "Select Domains"
            ),

            div(
              class = "card-body",
              "Dashboard Content"
            )
          )
        )
      )
    )
  )
)

server<-function(input,output,session){

}
shinyApp(ui,server)
