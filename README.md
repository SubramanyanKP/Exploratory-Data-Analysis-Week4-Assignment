# Exploratory Data Analysis - Assignment - Week4

## Course project for week 4 peer graded assessment.

Please refer the following URL for the data being used for this assessment :

[Data for Peer Assessment ](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip)

## Instruction :
You must address the following questions and tasks in your exploratory analysis. For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.

## Questions :
1) Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

2) Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

3) Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

4) Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

5) How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

6) Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater changes over time in motor vehicle emissions?

## Solution :

#### Each of the questions enlisted above have been solved with a seperate plot and a corresponding R script as mentioned below:

a) Please refer to "plot1.R"  for Rcode that has been coded to arrive at "plot1.png" which is the corresponding plot  illustrating
the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

b) Please refer to "plot2.R"  for Rcode that has been coded to arrive at "plot2.png" which is the corresponding plot illustrating
whether total emissions from PM2.5 have decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008.

c) Please refer to "plot3.R"  for Rcode that has been coded to arrive at "plot3.png" which is the corresponding plot illustrating,
which of the four sources have seen decreases in emissions from 1999–2008 for Baltimore City and which of them have seen increases in emissions from 1999–2008.

d) Please refer to "plot4.R"  for Rcode that has been coded to arrive at "plot4.png" which is the corresponding plot illustrating as to
how emissions from coal combustion-related sources have changed from 1999–2008 across the United States.

e) Please refer to "plot5.R"  for Rcode that has been coded to arrive at "plot5.png" which is the corresponding plot illustrating as to
how emissions from motor vehicle sources  have changed from 1999–2008 in Baltimore City.

f) Please refer to "plot6.R"  for Rcode that has been coded to arrive at "plot6.png" which is the corresponding plot illustrating the
city that has seen greater changes over time in motor vehicle emissions when comparing emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽").

## Inference :

a ) Looking at the plot1.png  we get to infer that total emissions from PM2.5 have decreased in the US from 1999 to 2008 by 3.868761^{6} tons.

b ) Total emissions from PM2.5 in Balitmore have decreased from 1999 to 2008 by 1411.898 tons, as demonstrated in the plot2.png.

c ) As per plot3.png, all source types appear to have decreased from 1999 to 2008 in Baltimore, with the exception of of the “point” type source.

d ) On Observing the results as per plot4.png, total coal combustion emissions in the US have decreased by 2.28694^{5} tons from 1999 to 2008.

e ) Emissions from motor vehicles in Baltimore have decreased by 258.5445 tons from 1999 to 2008.The same can be inferred on observation of the plot5.png.

f ) The greatest magnitude of change in emissions from motor vehicle occurred in Baltimore City,  which experienced a decrease of 258.5445 tons, while Los Angeles experienced an increase of 163.44 tons due to emissions from motor vehicleof  during the 1999-2008 period.
