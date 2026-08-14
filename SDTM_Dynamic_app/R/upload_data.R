upload_data_ui <- function(id) {

  therapeutic_areas <- c(
    "Oncology",
    "Hematology",
    "Cardiology",
    "Neurology",
    "Psychiatry",
    "Immunology",
    "Rheumatology",
    "Dermatology",
    "Endocrinology",
    "Diabetes",
    "Gastroenterology",
    "Hepatology",
    "Nephrology",
    "Pulmonology",
    "Infectious Diseases",
    "Vaccines",
    "Women's Health",
    "Men's Health",
    "Rare Diseases",
    "Ophthalmology",
    "Urology",
    "Pediatrics",
    "Respiratory",
    "Pain Management",
    "Metabolic Disorders",
    "Allergy",
    "Critical Care",
    "Anesthesiology",
    "Transplantation",
    "Genetic Disorders"
  )
  ns <- NS(id)


  fluidRow(
    bslib::card(
    fill=FALSE,
    height = "200px",
    style = "width: 1800px;",
      card_header("Upload Study Information:"),

      card_body(

      fluidRow(
        column(width = 2,
        selectizeInput(inputId = ns("select_input_type"),width = "100%",label = "Select Type:",choices = c("","blinded","unblinded"), selected = "",
                    options = list(
                      placeholder = "Select Type"
                    )),
),
column(width = 2,
        selectizeInput(inputId = ns("select_input_dataset_type"),width = "100%",label = "Select Dataset Type:",choices = c("","SDTM (Tabulation)","ADAM (Analysis)","SEND (NonClinical)"),selected = "",
                       options = list(
                         placeholder = "Select Dataset Type"
                       )
                       ),
),
column(width = 2,

       selectizeInput(
         ns("select_input_therapeutic"),
         "Select Therapeutic Area:",
         choices = c("",therapeutic_areas),
         selected = "",
         options = list(
           placeholder = "Select TA"
         )
)
),
column(width = 2,

       selectizeInput(
         ns("select_input_version"),
         "Select Version:",
         choices = c("",c("SDTMIG 3.2","SDTMIG 3.3","ADAMIG 1.2")),
         selected = "",
         options = list(
           placeholder = "Select TA"
         )
       )
),
column(width = 3,
       fileInput(ns("upload_raw_dataset"),label = "Upload Raw Dataset:",placeholder = "Choose the Dataset",accept = c(".csv",".xlsl",".sas7bdat"),multiple = FALSE)),

column(width = 1,
       tags$div(class="Proceed-action-button",
                actionButton(ns("proceed_raw_dataset_button"),label = "Proceed")),

       uiOutput(ns("warning_info_missing_input_ui"))
)
)
     )
    ),

bslib::card(
  fill=FALSE,
  height = "800px",
  style = "width: 1800px;",
  card_header("View of Input Dataset:"),

  card_body(
    DT::DTOutput(ns("view_input_dataset"))
  ))
)


}


upload_data_server<-function(id){

  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    # server of the action button proceed_raw_dataset_button
    observeEvent(input$proceed_raw_dataset_button,{


     if(input$select_input_type == "" & input$select_input_dataset_type =="" & input$select_input_therapeutic == "" & input$select_input_version == "" & is.null(input$upload_raw_dataset) == TRUE ){
       output$warning_info_missing_input_ui<-renderUI({
         tags$div(class="warning-info-text",
                  textOutput(ns("warning_info_text"))
                  )
       })


     }else{
       output$warning_info_missing_input_ui<-renderUI({
       tags$div(class="thank-you-text",
                textOutput(ns("thankyou_text"))
       )
        })
     }

      output$warning_info_text<-renderText({
        paste0("Please fill the information above")
      })
      output$thankyou_text<-renderText({
        paste0("Thank you for the information")
      })

    })  #close of the observe event

  #reactive function to the uploaded dataset
    uploaded_data<-reactive({
      req(input$upload_raw_dataset)  #wait until  a file is uploaded
      read.csv(
        input$upload_raw_dataset$datapath,

        stringsAsFactors = FALSE
      )
    })


  #rendering the data table of the file input

    output$view_input_dataset<-renderDT({

      datatable(

        uploaded_data(),

        filter = "top", # Adds filter boxes to each column

        options = list(

          pageLength = 10

        )

      )
    })





  })

}

