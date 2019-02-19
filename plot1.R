library(ggplot2)
library(dplyr)
library(stats)
library(base)
library(datasets)

# Unzip that given data into your working directory
# and read the .rds files into two veriables.

NEI_data <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
SCC_data <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")


# Observe what is inside the dataset
head(NEI_data)

# Group the NEI data by year and summarize total emissions across the board

total_emissions_year <- NEI_data %>%  
  group_by(year) %>%
  summarize(Total_Emissions = sum(Emissions, na.rm = TRUE))

total_emissions_year

# plot the data summarized as above into plot1.png
with(total_emissions_year,  
     plot(x = year, 
          y = Total_Emissions, 
          ylab = "Total Annual Emissions [in Tons]", 
          xlab = "Year",
          main = "Total Annual Emissions in United States by Year",
          cex = 2,
          pch = 2,
          col = "magenta",
          lwd = 3))
dev.copy(png, file = "plot1.png")
dev.off( )

# Find delta between 2008 and 1999
total_emissions_2008 <- total_emissions_year[total_emissions_year$year == 2008, 2]
total_emissions_1999 <- total_emissions_year[total_emissions_year$year == 1999, 2]

delta_total_emissions <- total_emissions_2008 - total_emissions_1999

delta_total_emissions

