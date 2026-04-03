# ---- user interface ----
ui <- navbarPage(
  
  # title
  title = "LTER Animal Data Explorer",
  
  # (Page 1) into tabPanel ----
  tabPanel(title = "About this App",
           
           # intro text fluidRow ----
           fluidRow(
             
             column(1),
             column(10, includeMarkdown("text/about.md")),
             column(1)
             
           ), # END intro text fluidRow
           
           hr(),
           
           includeMarkdown("text/footer.md")
           
           ), # END (Page 1) intro tabPanel
  
  tabPanel(title = "Explore the Data",
           
           # tabsetPanel to contain tabs for data viz ----
           tabsetPanel(
             
             # trout tabPanel ----
             tabPanel(
               
               title = "Trout",
               
               # trout sidebarLayout ----
               sidebarLayout(
                 
                 # trout sidebarPanel ----
                 sidebarPanel(
                   
                   # channel type pickerInput ----
                   pickerInput(inputId = "channel_type_input", 
                               label = "Select channel type(s):",
                               choices = unique(clean_trout$channel_type),
                               selected = c("cascade", "pool"),
                               multiple = TRUE,
                               options = pickerOptions(actionsBox = TRUE)), # END channel type pickerInput
                   
                   # section checkboxGroupButtons ----
                   checkboxGroupButtons(inputId = "section_input",
                                        label = "Select a Sampling Section",
                                        choices = unique(clean_trout$section),
                                        selected = c("clear cut forest", "old growth forest"), 
                                        justified = TRUE,
                                        checkIcon = list(yes = icon("check", lib = "font-awesome"),
                                                         no = icon("xmark", lib = "font-awesome")) # END section checkboxGroupInput
                   )
                   
                 ), # END trout sidebarPanel
                 
                 # trout mainPanel ----
                 mainPanel(
                   
                   plotOutput(outputId = "trout_scatterplot_output")
                   
                 ) # END trout mainPanel
                 
               ) # END trout sidebarLayout
               
             ), # END trout tabPanel
             
             # penguins tabPanel ----
             tabPanel(
               
               title = "Penguin",
               
               # penguin sidebarLayout ----
               sidebarLayout(
                 
                 # penguin sidebarPanel ---
                 sidebarPanel(
                   
                   # island pickerInput ----
                   pickerInput(inputId = "penguin_island_input", 
                               label = "Select island(s):",
                               choices = unique(penguins$island),
                               selected = c("Dream", "Torgersen"),
                               multiple = TRUE,
                               options = pickerOptions(actionsBox = TRUE)), # END island pickerInput
                   
                   # bin number sliderInput ----
                   sliderInput(inputId = "bin_number_input",
                               label = "Select number of bins",
                               min = 1, max = 25, value = 10) # END bin number sliderInput
                   
                 ), # END penguin sidebarPanel
                 
                 # penguin mainPanel ----
                 mainPanel(
                
                   plotOutput(outputId = "penguin_histogram_output")
                   
                 ) # END penguin mainPanel
                 
               ) # END penguin sidebarLayout
               
             ) # END penguins tabPanel
             
           ) # END tabsetPanel
           
           ), # END (Page 2) data tabPanel
  
) # END navbarPage