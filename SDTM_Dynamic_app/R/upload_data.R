upload_data_ui <- function(id) {
  ns <- NS(id)

  tagList(
  h2("Welcome to Data2SDTM"),
  p("another textdfsf")

)
  }
upload_data_server<-function(id){

  moduleServer(id, function(input, output, session) {


  })

}

