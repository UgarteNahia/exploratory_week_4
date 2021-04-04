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
# 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

baltimore <- subset(NEI, NEI$fips == "24510")

totalBaltimore <- aggregate(Emissions ~ year, baltimore, sum)

png("plot2.png",width = 480, height = 480)
plot(totalBaltimore$year, totalBaltimore$Emissions, type = "o", main = expression("Total Baltimore" ~ PM[2.5] ~ "Emissions by Year"), xlab = "Year", ylab = expression("Total Baltimore "~ PM[2.5] ~ "Emissions"))
dev.off()
