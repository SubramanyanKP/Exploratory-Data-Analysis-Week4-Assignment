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

# Group the NEI data by year and summarize total emissions
# in the Baltimore City

total_emissions_baltimore <- NEI_data %>%
  subset(fips == "24510") %>%
  group_by(year) %>%
  summarize(Total_Emissions_Baltimore = sum(Emissions, 
                                            na.rm = TRUE))

total_emissions_baltimore

# plot the data summarized as above into plot2.png
with(total_emissions_baltimore, 
     plot(x = year, 
          y = Total_Emissions_Baltimore, 
          ylab = "Total Annual Emissions [ In Tons]", 
          xlab = "Year",
          main = "Total Annual Emissions in the city Of Baltimore by Year",
          cex = 2,
          pch = 2,
          col = "red",
          lwd = 3))

dev.copy(png, file = "plot2.png")
dev.off( )

# Find delta between 2008 and 1999 for the city of Baltimore

total_emissions_baltimore_2008 <- total_emissions_baltimore[total_emissions_baltimore$year == 2008, 2]
total_emissions_baltimore_1999 <- total_emissions_baltimore[total_emissions_baltimore$year == 1999, 2]

delta_emissions_baltimore <- total_emissions_baltimore_2008 - total_emissions_baltimore_1999

delta_emissions_baltimore