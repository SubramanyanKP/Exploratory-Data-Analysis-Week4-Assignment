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

# Merge the NEI and SCC datasets to see the EI.Sector column, which
# will be filtered for words containing "coal".
# This will lead to the contributions to emissions from coal combustion.

SCC_coal_comb <- SCC_data[grep("[Cc]oal",SCC_data$EI.Sector),]
NEI_sub_coal <- subset(NEI_data, 
                       NEI_data$SCC %in% SCC_coal_comb$SCC)


NEI_coal_comb <- merge(x = NEI_sub_coal, 
                       y = SCC_data, 
                       by.x = "SCC", 
                       by.y = "SCC")

NEI_coal_comb_total <- NEI_coal_comb %>% 
  group_by(year) %>%
  summarize(Total_Coal_Comb = sum(Emissions, na.rm = TRUE))

NEI_coal_comb_plot <- ggplot(NEI_coal_comb_total, aes(year, Total_Coal_Comb))



# plot the data summarized as above into plot4.png using ggplot2

NEI_coal_comb_plot <- NEI_coal_comb_plot + 
  geom_point(color = "red", 
             size = 4, 
             alpha = 1/3) + 
  xlab("Year") +
  ylab("Total Emissions [ In Tons]") +
  ggtitle("Total Annual Coal Combustion Emissions in the United States")

NEI_coal_comb_plot

dev.copy(png, file = "plot4.png")
dev.off( )

# Arrive at Total coal combustion emissions from 1999 to 2008.

NEI_coal_comb_total_2008 <- NEI_coal_comb_total[NEI_coal_comb_total$year == 2008, 2]
NEI_coal_comb_total_1999 <- NEI_coal_comb_total[NEI_coal_comb_total$year == 1999, 2]

NEI_coal_comb_delta <- NEI_coal_comb_total_2008 - NEI_coal_comb_total_1999

NEI_coal_comb_delta