# #
# # This is a Shiny web application. You can run the application by clicking
# # the 'Run App' button above.
# #
# # Find out more about building applications with Shiny here:
# #
# #    http://shiny.rstudio.com/
# #
#
# library(shiny)
#
# library(bs4Dash)
#
# ui <- dashboardPage(
#   header = dashboardHeader(),
#   sidebar = dashboardSidebar(
#     fileInput("csv_file","upload")
#   ),
#   body = dashboardBody(
#
#     bs4Card(
#       title = "Patient Information",
#       width = 12,
#       status = "primary",
#       solidHeader = TRUE,
#
#       p("Patient Profile Content"),
#       DT::DTOutput("distPlot")
#     )
#
#   )
# )
#
#
#
#
# library(DT)
#
# server <- function(input, output, session) {
#
#   data <- reactive({
#
#     req(input$csv_file)
#
#     read.csv(
#       input$csv_file$datapath,
#       stringsAsFactors = FALSE
#     )
#
#   })
#
#   output$distPlot <- renderDT({
#     datatable(
#       data(),
#       filter = "top",
#       options = list(scrollX = TRUE)
#     )
#   })
#
# }
#
#
# # Run the application
# shinyApp(ui = ui, server = server)



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

  sidebar = dashboardSidebar(disable = TRUE),

  body = dashboardBody(
    tabsetPanel(
      id = "tabs",
      tabPanel("Home",
               h2("Home Page")),
      tabPanel("Reports",
               h2("Reports Page"),

               fluidRow(

                 bs4Card(
                   title = "Select Data",
                   width = 6,
                   sliderInput(
                     "slider",
                     "Number of observations:",
                     1,
                     100,
                     50
                   )
                 ),

                 bs4Card(
                   title = "Select Domains",
                   width = 6,
                   status = "primary",
                   "Dashboard Content"
                 )
               )
      ),
      tabPanel("Settings",
               h2("Settings Page"))
    )

  )
)

server<-function(input,output,session){

}
shinyApp(ui,server)
