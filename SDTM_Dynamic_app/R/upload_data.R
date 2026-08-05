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
      height = "100px",
      card_header("Study Information"),

      card_body(

        selectInput(inputId = ns("select_input_type"),width ="200px",label = "Select Type:",choices = c("blinded","unblinded"),selected = NULL),

        selectInput(inputId = ns("select_input_dataset_type"),width ="200px",label = "Select Dataset Type:",choices = c("SDTM (Tabulation)","ADAM (Analysis)","SEND (NonClinical)"),selected = NULL),
        selectInput(inputId = ns("select_input_therapeutic"),width ="200px",label = "Select Therapeutic Area:",choices = therapeutic_areas,selected = NULL)



      )
    )




  )





  }
upload_data_server<-function(id){

  moduleServer(id, function(input, output, session) {


  })

}

