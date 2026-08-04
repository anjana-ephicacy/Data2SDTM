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




#
# ui <- dashboardPage(
#   header = dashboardHeader(
#     title = "Data2SDTM"
#   ),
#
#   sidebar = dashboardSidebar(disable = TRUE),
#
#   body = dashboardBody(
#     tabsetPanel(
#       id = "tabs",
#       tabPanel("Home",
#                h2("Home Page")),
#       tabPanel("Reports",
#                h2("Reports Page"),
#
#                fluidRow(
#
#                  bs4Card(
#                    title = "Select Data",
#                    width = 6,
#                    sliderInput(
#                      "slider",
#                      "Number of observations:",
#                      1,
#                      100,
#                      50
#                    )
#                  ),
#
#                  bs4Card(
#                    title = "Select Domains",
#                    width = 6,
#                    status = "primary",
#                    "Dashboard Content"
#                  )
#                )
#       ),
#       tabPanel("Settings",
#                h2("Settings Page"))
#     )
#
#   )
# )
#
# server<-function(input,output,session){
#
# }
# shinyApp(ui,server)


# library(shiny)
# library(bslib)
#
# ui <- page_navbar(
#
#   title = div(
#     class = "brand-area",
#
#     tags$img(
#       src = "logo.png",
#       height = "45px"
#     )
#   ),
#
#   theme = bs_theme(
#     version = 5,
#     bootswatch = "flatly"
#   ),
#
#   header = tags$head(
#     includeCSS("www/style.css")
#   ),
#
#   nav_panel(
#     "Home",
#     h2("Home Page")
#   ),
#
#   nav_panel(
#     "Generate",
#     h2("Generate Data")
#   ),
#
#   nav_panel(
#     "Synthetic Study Builder",
#     h2("Study Builder")
#   ),
#
#   nav_panel(
#     "OpenFDA",
#     h2("OpenFDA")
#   ),
#
#   nav_panel(
#     "Contact Us",
#     h2("Contact Us")
#   ),
#
#   nav_panel(
#     "FAQ",
#     h2("FAQ")
#   ),
#
#   nav_panel(
#     "API Docs",
#     h2("API Documentation")
#   )
# )
#
# server <- function(input, output, session) {}
#
# shinyApp(ui, server)

library(shiny)
library(bs4Dash)

ui <- bs4DashPage(

  header = bs4DashNavbar(

    title = tags$div(
      tags$img(
        src = "logo.png",
        height = "40px"
      )
    ),

    navbarMenu(
      id = "mainmenu",

      navbarTab(
        text = "Home",
        tabName = "home",
        icon = icon("house")
      ),

      navbarTab(
        text = "Generate",
        tabName = "generate",
        icon = icon("gear")
      ),

      navbarTab(
        text = "Synthetic Study Builder",
        tabName = "study",
        icon = icon("table")
      ),

      navbarTab(
        text = "OpenFDA",
        tabName = "openfda",
        icon = icon("database")
      ),

      navbarTab(
        text = "Contact Us",
        tabName = "contact",
        icon = icon("envelope")
      )
    )
  ),

  sidebar = bs4DashSidebar(disable = TRUE),

  body = bs4DashBody(
    tags$head(
      includeCSS("www/style.css")
    ),

    h2("Data2SDTM Application")
  ),

  controlbar = bs4DashControlbar(disable = TRUE)
)

server <- function(input, output, session) {}

shinyApp(ui, server)
