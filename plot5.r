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
#5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

baltimoreMotor <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")
baltimoreMotorAGG <- aggregate(Emissions ~ year, baltimoreMotor, sum)

png("plot5.png",width = 480, height = 480)
ggplot(baltimoreMotorAGG, aes(year, Emissions)) +
  geom_line(col = "steelblue3") +
  geom_point(col = "steelblue3") +
  ggtitle(expression("Baltimore " ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
  xlab("Year") +
  ylab(expression(~PM[2.5]~ "Motor Vehicle Emissions"))
dev.off()

