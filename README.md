Haiti Ransom Analysis Shiny App by Patrick Prézeau Stephenson (@stepminer2)
This repository contains a Shiny app that provides an interactive analysis of Haiti's historical debt payments to France, specifically focusing on the "double debt" that Haiti incurred following its independence in 1825. The app updates the New York Times' estimates to 2024 dollars, allowing users to explore the long-term economic impact of these payments in a modern context. The live app is available here: https://stepminer.shinyapps.io/Haiti_Independence_Ransom/

Overview
Haiti's "double debt" refers to the financial obligations imposed by France in 1825. These obligations included both an indemnity demanded by France to compensate former colonists and a loan Haiti took out to begin making these payments. The debt burden significantly affected Haiti's economy and development for decades. This Shiny app provides a detailed visualization of the payments Haiti made, adjusted for inflation to 2024 U.S. dollars.

Features
Interactive Data Visualization: Explore Haiti's historical debt payments and how they evolved over time.
Inflation Adjustments: View payments in both historical French francs and adjusted to 2024 U.S. dollars for a contemporary understanding.
Detailed Data Analysis: Analyze different components of the debt, including indemnity payments, loan principal and interest payments, and late fees.
Historical Context: Access information on the history of payments and how the debt impacted Haiti's economic development.
Data Sources
The data used in this app is based on historical records and estimates provided by The New York Times, which includes:

Payments made on the indemnity.
Payments on the principal and interest of the 1825 loan.
Late fees accrued on overdue payments.
Exchange rates and Consumer Price Index (CPI) data to adjust historical values to 2024 U.S. dollars.
Data Fields
YEAR: Calendar year.
DOUBLE-DEBT-DRAWDOWN: The remaining debt each year in French francs after payments. Values are not adjusted for inflation and do not include future interest or late fees.
PAYMENTS-DOUBLE-DEBT-FRANCS: Total payments made by Haiti for the double debt in French francs.
PAYMENTS-INDEMNITY: Payments on the indemnity demanded by France.
PAYMENTS-PRINCIPAL-INTEREST-1825-LOAN: Payments on the principal and interest of the 1825 loan.
LATE-FEES: Late fees introduced by France after 1870.
CONSUMER-PRICE-INDEX-USD: 19th-century U.S. dollar Consumer Price Index data.
EXCHANGE-RATE-USD-TO-FRANC: Historical exchange rates from French francs to U.S. dollars.
HAITI-HISTORICAL-GDP-USD: Estimates of Haiti's historical GDP in U.S. dollars.
DOUBLE-DEBT-IN-2021-USD: The total sum of the double debt paid each year, converted to U.S. dollars and adjusted for inflation to 2021.
Calculation Methodology
The conversion to 2024 U.S. dollars involves using historical exchange rates and CPI data. The following formula was used for the adjustment:

DOUBLE-DEBT-IN-2024-USD
=
(
Total double debt paid that year
Exchange rate, franc to USD
)
×
(
2024 CPI
that year’s CPI
)
DOUBLE-DEBT-IN-2024-USD=( 
Exchange rate, franc to USD
Total double debt paid that year
​
 )×( 
that year’s CPI
2024 CPI
​
 )
How to Run the App
Clone this repository to your local machine using the command:

bash
Copy code
git clone https://github.com/yourusername/haiti-debt-analysis.git
Install the necessary packages if they are not already installed:

R
Copy code
install.packages(c("shiny", "ggplot2", "dplyr", "readr"))
Run the Shiny app by executing the following command in your R console:

R
Copy code
shiny::runApp('path/to/your/app/directory')
Sources and References
Archival Sources: Caisse des Dépôts et Consignations, French National Overseas Archives, French National Archives, etc.
Secondary Sources: Works by Beaubrun Ardouin, Jean-François Brière, Frédérique Beauvois, and others as detailed in the bibliography.
Data Sources: Consumer Price Index data from the Federal Reserve Bank of Minneapolis, exchange rates from Victor Bulmer-Thomas, historical GDP figures from Simon Henochsberg.
For a full bibliography and detailed explanation of the data set, please refer to the project's documentation.

License
This project is licensed under the MIT License - see the LICENSE file for details.

Feel free to contribute by submitting pull requests, reporting issues, or suggesting new features!
