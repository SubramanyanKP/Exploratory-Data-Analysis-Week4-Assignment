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

# Merge the NEI and SCC datasets to Compare emissions 
# from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County

vehicle_scc <- SCC_data[grep("[Vv]eh", SCC_data$Short.Name), ]

emissions_motor_baltimore <- NEI_data %>% 
  subset(fips == "24510" & NEI_data$SCC %in% vehicle_scc$SCC) %>%
  merge(y = vehicle_scc, by.x = "SCC", by.y = "SCC") %>%
  group_by(year) %>%
  summarize(Vehicle_Emissions_Type = sum(Emissions, na.rm = TRUE))


emissions_motor_losangles <- NEI_data %>% 
  subset(fips == "06037" & NEI_data$SCC %in% vehicle_scc$SCC) %>%
  merge(y = vehicle_scc, by.x = "SCC", by.y = "SCC") %>%
  group_by(year) %>%
  summarize(Vehicle_Emissions_Type = sum(Emissions, na.rm = TRUE))

emissions_motor_baltimore2 <- cbind(emissions_motor_baltimore, "City" = rep("Baltimore", 4))
emissions_motor_losangles2 <- cbind(emissions_motor_losangles, "City" = rep("LA", 4))

emissions_motor_comp <- rbind(emissions_motor_baltimore2, emissions_motor_losangles2)

emissions_motor_comp

# plot the data summarized as above into plot6.png using ggplot2

emissions_motor_comp_plot <- ggplot(emissions_motor_comp, aes(year, Vehicle_Emissions_Type, col = City)) +
  geom_point(size = 4, 
             alpha = 1/3) +
  xlab("Year") +
  ylab("Total Emissions [In Tons]") +
  ggtitle("Comparison of Total Annual Vehicle Emissions in Baltimore and LA")

emissions_motor_comp_plot


dev.copy(png, file = "plot6.png")
dev.off( )

# Calculate the total annual emissions in the city of Baltimore from 1999-2008 in Baltimore City.

emissions_motor_baltimore_2008 <- emissions_motor_baltimore[emissions_motor_baltimore$year  == 2008, 2]
emissions_motor_baltimore_1999 <- emissions_motor_baltimore[emissions_motor_baltimore$year  == 1999, 2]

delta_baltimore <- emissions_motor_baltimore_2008 - emissions_motor_baltimore_1999

delta_baltimore


emissions_motor_la_2008 <- emissions_motor_losangles[emissions_motor_losangles$year  == 2008, 2]
emissions_motor_la_1999 <- emissions_motor_losangles[emissions_motor_losangles$year  == 1999, 2]

delta_losangles <- emissions_motor_la_2008 - emissions_motor_la_1999

delta_losangles
abs(delta_losangles) > abs(delta_baltimore)
