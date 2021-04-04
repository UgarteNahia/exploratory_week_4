setwd("C:/Users/Administrador/Desktop/datasciencecoursera/exploratory_week_4")
rm(list=ls(all=TRUE))
memory.limit(14000) ## Incrementar memoria disponible para R

library(ggplot2)
library(RColorBrewer)

# Load the data:

NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# Check them
str(NEI)
str(SCC)

## 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

totalNEI <- aggregate(Emissions ~ year, NEI, sum)

png("plot1.png",width = 480, height = 480)
plot(totalNEI$year,totalNEI$Emissions,type = "o", main = expression("Total US "~ PM[2.5]~ "Emissions by Year"), xlab = "Year", ylab =  expression("Total US "~   PM[2.5] ~ "Emissions"))
dev.off()