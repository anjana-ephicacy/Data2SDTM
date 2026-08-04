# library(shiny)
# library(bs4Dash)
#
# ui <- dashboardPage(
#
#   header = dashboardHeader(
#     title = "Patient Profile"
#   ),
#
#   sidebar = dashboardSidebar(
#
#     sidebarMenu(
#       menuItem(
#         text = "Dashboard",
#         tabName = "dashboard",
#         icon = icon("dashboard")
#       ),
#
#       menuItem(
#         text = "Patient Profile",
#         tabName = "patient",
#         icon = icon("user")
#       )
#     )
#   ),
#
#   body = dashboardBody(
#
#     tabItems(
#
#       tabItem(
#         tabName = "dashboard",
#
#         fluidRow(
#           bs4Card(
#             title = "Dashboard Summary",
#             width = 12,
#             status = "primary",
#             "Dashboard Content"
#           )
#         )
#       ),
#
#       tabItem(
#         tabName = "patient",
#
#         fluidRow(
#           bs4Card(
#             title = "Patient Information",
#             width = 12,
#             status = "success",
#             "Patient Profile Content"
#           )
#         )
#       )
#
#     )
#   )
# )
#
# server <- function(input, output, session) {}
#
# shinyApp(ui, server)


if (interactive()) {
  library(shiny)
  library(bs4Dash)

  tabs <- tabItems(.list = lapply(1:7, function(i) {
    tabItem(tabName = sprintf("Tab%s", i), sprintf("Tab %s", i))
  }))

  shinyApp(
    ui = dashboardPage(
      header = dashboardHeader(
        navbarMenu(
          id = "navmenu",
          navbarTab(tabName = "Tab1", text = "Tab 1"),
          navbarTab(tabName = "Tab2", text = "Tab 2"),
          navbarTab(
            text = "Menu",
            dropdownHeader("Dropdown header"),
            navbarTab(tabName = "Tab3", text = "Tab 3"),
            dropdownDivider(),
            navbarTab(
              text = "Sub menu",
              dropdownHeader("Another header"),
              navbarTab(tabName = "Tab4", text = "Tab 4"),
              dropdownHeader("Yet another header"),
              navbarTab(tabName = "Tab5", text = "Tab 5"),
              navbarTab(
                text = "Sub sub menu",
                navbarTab(tabName = "Tab6", text = "Tab 6"),
                navbarTab(tabName = "Tab7", text = "Tab 7")
              )
            )
          )
        )
      ),
      body = dashboardBody(tabs),
      controlbar = dashboardControlbar(
        sliderInput(
          inputId = "controller",
          label = "Update the first tabset",
          min = 1,
          max = 4,
          value = 1
        )
      ),
      sidebar = dashboardSidebar(disable = TRUE)
    ),
    server = function(input, output, session) {
      observeEvent(input$controller, {
        updateNavbarTabs(
          session,
          inputId = "navmenu",
          selected = paste0("Tab", input$controller)
        )
      },
      ignoreInit = TRUE
      )
    }
  )
}
