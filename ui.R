# Load the ggplot2 package which provides
library(ggplot2)
library(DT)
library(shiny)
library(shinydashboard)
library(plotly)

dashboardPage(skin = "black",
  dashboardHeader(title = "UK Companies offering Visa Sponsorship", titleWidth = 450,
    tags$li(class="dropdown",tags$a(href="https://www.linkedin.com/in/baptiste-levrard-b349aa12b/" ,icon("linkedin"), target="_blank"))),
  dashboardSidebar(width = 450,
                   column(12,br(),
h1(strong("Read me"),style="font-size:40px"),
br(),
br(),
p("This application has been, made for anyone going through the process of looking for a Tiers 2 UK Visa Sponsorship. It has been made for a school assignment with a perpective of making it more easy to navigate through the huge and complexe UK Database of companies offering UK Visa Sponsorship, find an internship and find a job.",style="font-size:20px"),
br(),
p(icon("info"),"The Database used, while official, is not updated. Everyday few days, UK government update their database. For the most recent Database please visit",style="font-size:20px",a("UK.gov.",href="https://www.gov.uk/government/publications/register-of-licensed-sponsors-workers"),icon("info")),
br(),
p("To go further you will find in the following link the essential informations linked to work visa in the UK. It’s imperative you check it out before starting looking for jobs :",style="font-size:20px",a("Skilled Workers.",href="https://www.gov.uk/skilled-worker-visa")), 
br(),
p("Use this database simply : Choose the cities, the areas of expertise, look up the company on the web and start applying for jobs. Now click the arrow next to the title, and go and get them tiger.",style="font-size:20px"))),
  dashboardBody(
    tags$head(tags$style(HTML('
      .main-header .sidebar-toggle:before {
        content: "\\f104";}'))),
    
fluidPage(
  titlePanel("Databases of the existing UK companies able to offer a sponsorship"),
  
  # Create a new Row in the UI for selectInputs
  fluidRow(
    column(6,
           selectInput("town",
                       "Town:",
                       c("All",
                         unique(as.character(UkSponsors_Assignment1$town))),
                       selected = "All",
                       multiple = TRUE)
    ),
    column(6,
           selectInput("ind",
                       "Industry:",
                       c("All",
                         unique(as.character(UkSponsors_Assignment1$industry))),
                       selected = "All",
                       multiple = TRUE)
    )
  ),
  # Create a new row for the table.
  DT::dataTableOutput("table")
)
)
)


