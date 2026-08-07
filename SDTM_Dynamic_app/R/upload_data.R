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
  layout_columns(

    bslib::card(
    fill=FALSE,
    height = "300px",
    style = "width: 1200px;",
      card_header("Upload Study Information:"),

      card_body(

      fluidRow(
        column(width = 2,
        selectizeInput(inputId = ns("select_input_type"),width = "100%",label = "Select Type:",choices = c("","blinded","unblinded"), selected = "",
                    options = list(
                      placeholder = "Select Type"
                    )),
),
column(width = 3,
        selectInput(inputId = ns("select_input_dataset_type"),width = "100%",label = "Select Dataset Type:",choices = c("SDTM (Tabulation)","ADAM (Analysis)","SEND (NonClinical)"),selected = NULL),
),
column(width = 3,

       selectizeInput(
         ns("select_input_therapeutic"),
         "Select Therapeutic Area::",
         choices = c("",therapeutic_areas),
         selected = "",
         options = list(
           placeholder = "Select TA"
         )
)
),
column(width = 4,

       selectizeInput(
         ns("select_input_version"),
         "Select Version::",
         choices = c("",c("SDTMIG 3.2","SDTMIG 3.3","ADAMIG 1.2")),
         selected = "",
         options = list(
           placeholder = "Select TA"
         )
       )
)
),
fluidRow(
  column(width = 4,
fileInput(ns("upload_raw_dataset"),label = "Upload Raw Dataset:",placeholder = "Choose the Dataset",accept = c(".csv",".xlsl",".sas7bdat"),multiple = FALSE)),
column(width = 2,
tags$div(class="Proceed-action-button",
       actionButton(ns("proceed_raw_dataset_button"),label = "Proceed")))
)
      )
    )

)
  }
upload_data_server<-function(id){

  moduleServer(id, function(input, output, session) {


  })

}

