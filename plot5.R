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

# Merge the NEI and SCC datasets to see the Short.Name column, which
# will be filtered for words containing "veh".
# This will lead to the contributions to total annual vehicle emission
# in the city if Baltimore.

vehicle_scc <- SCC_data[grep("[Vv]eh", SCC_data$Short.Name), ]

emissions_motor_baltimore <- NEI_data %>% 
  subset(fips == "24510" & NEI_data$SCC %in% vehicle_scc$SCC) %>%
  merge(y = vehicle_scc, by.x = "SCC", by.y = "SCC") %>%
  group_by(year) %>%
  summarize(Vehicle_Emissions_Type = sum(Emissions, na.rm = TRUE))



# plot the data summarized as above into plot5.png using ggplot2

emissions_motor_baltimore_plot <- ggplot(emissions_motor_baltimore, aes(year, Vehicle_Emissions_Type)) +
  geom_point(color = "brown", 
             size = 4, 
             alpha = 1/3) + 
  xlab("Year") +
  ylab("Total Emissions [In Tons]") +
  ggtitle("Total Annual Vehicle Emissions in Baltimore City")

emissions_motor_baltimore_plot

dev.copy(png, file = "plot5.png")
dev.off( )

# Calculate the total annual emissions in the city of Baltimore from 1999-2008 in Baltimore City.


emissions_motor_baltimore_2008 <- emissions_motor_baltimore[emissions_motor_baltimore$year  == 2008, 2]
emissions_motor_baltimore_1999 <- emissions_motor_baltimore[emissions_motor_baltimore$year  == 1999, 2]

delta_baltimore <- emissions_motor_baltimore_2008 - emissions_motor_baltimore_1999

delta_baltimore