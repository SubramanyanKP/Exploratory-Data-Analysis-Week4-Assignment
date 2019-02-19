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

# Group the NEI data  with subset of fips == "24510" by year and type
# and summarize total emissions in the Baltimore City.

total_emissions_type <- NEI_data %>% 
  subset(fips == "24510") %>%
  group_by(year, type) %>%
  summarize(Total_Emissions_Type = sum(Emissions, na.rm = TRUE))

# plot the data summarized as above into plot3.png using ggplot2

emission_type1 <- ggplot(data = total_emissions_type, aes(year, Total_Emissions_Type))

emission_type1 <- emission_type1 + 
  geom_point(color = "magenta", 
             size = 4, 
             alpha = 1/3) + 
  facet_grid(. ~ type) +
  xlab("Year") +
  ylab("Total Emissions [ In Tons]") +
  ggtitle("Total Annual Emissions in the city of Baltimore by Year")

emission_type1

dev.copy(png, file = "plot3.png")
dev.off( )