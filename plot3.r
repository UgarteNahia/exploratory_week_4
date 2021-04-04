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

# 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question. library(ggplot2)

baltimoreType <- aggregate(Emissions ~ year + type, baltimore, sum)

png("plot3_1.png",width = 480, height = 480)
ggplot(baltimoreType, aes(year, Emissions, col = type)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions by Type and Year")) +
  ylab(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions")) +
  xlab("Year") +
  scale_colour_discrete(name = "Type of sources") +
  theme(legend.title = element_text(face = "bold"))
dev.off()
