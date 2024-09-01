#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/

 # Load required libraries
library(shiny)
library(DT)  # For the datatable
library(ggplot2)  # For the plot
library(dplyr)  # For data manipulation




#
haiti_data <- read.csv("haiti_debt_2024.csv") %>% 
mutate( payment_pct_of_historical_gdp = payments_principal_interest_2024_usd/haiti_historical_gdp*100) %>% 
    filter(year <= 1890)
# Convert relevant columns to millions for presentation
haiti_data <- haiti_data %>%
  mutate(
    double_debt_in_2024_usd =  round(double_debt_in_2024_usd/10e5, 3),
    payments_principal_interest_2024_usd = round( payments_principal_interest_2024_usd/10e5 , 3),
    payment_pct_of_historical_gdp = round(payment_pct_of_historical_gdp, 2),
    haiti_historical_gdp = round ( haiti_historical_gdp/10e5, 3 ) ) %>% 
 select(contains("year"), contains("2024"), contains("gdp"),-contains("late_fees_2024"), -contains("francs"))

# Define the UI
ui <- fluidPage(
  titlePanel("Haiti Independance Ransom"),

  sidebarLayout(
    sidebarPanel(
      # Input to select a decade or all data
      selectInput("decade", "Select Decade:", 
                  choices = c("All", seq(1820, 1890, by = 10)),
                  selected = "All")
    ),

    mainPanel(
      tabsetPanel(
        tabPanel("Table View", DTOutput("table")),
        tabPanel("Line Graph", plotOutput("lineGraph"))
      )
    )
  )
)

# Define the server logic
server <- function(input, output) {

  # Reactive expression to filter data based on the selected decade
  filteredData <- reactive({
    if (input$decade == "All") {
      haiti_data
    } else {
      start_year <- as.numeric(input$decade)
      haiti_data %>%
        filter(year >= start_year & year < start_year + 10)
    }
  })

 # Render the data table with reduced column width
  output$table <- renderDT({
    datatable(
      filteredData(),
      options = list(
        pageLength = 10,
        autoWidth = FALSE,
        scrollX = TRUE  # Enable horizontal scrolling
      )
    ) %>%
      formatStyle(
        columns = c("year", "double_debt_in_2024_usd", 
                    "payments_principal_interest_2024_usd", "payment_pct_of_historical_gdp"),
        backgroundColor = styleInterval(5, c('lightblue', 'blue')),
        fontSize = '12px',  # Reduce font size for a more compact table
        width = '30px'  # Set a fixed width for columns
      )
  })
  

  # Render the line graph with a dynamic x-axis
  output$lineGraph <- renderPlot({
    # Get min and max years dynamically from filtered data
    min_year <- min(filteredData()$year)
    max_year <- max(filteredData()$year)
    
    ggplot(data = filteredData(), aes(x = year)) +
        
      geom_line(aes(y = double_debt_in_2024_usd, color = "Double Debt (2024 USD)")) +
      geom_line(aes(y = payments_principal_interest_2024_usd, color = "Payments Principal & Interest (2024 USD)")) +
      geom_line(aes(y = payment_pct_of_historical_gdp, color = "Payments % of GDP")) +
      labs(
        title = "Haiti Financial Data Over Time",
        x = "Year",
        y = "Value in Billions",
        color = "Legend"
      ) +
      theme_minimal() +
      theme(
        plot.title = element_text(hjust = 0.5),
        legend.position = "bottom"
      ) +
      scale_x_continuous(limits = c(min_year, max_year))  # Dynamically set x-axis limits
  })
}

# Run the application
shinyApp(ui = ui, server = server)