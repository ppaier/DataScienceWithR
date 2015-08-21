
# Load and prepare the data
# ------------------------------------------------------------------------------------
fileUrl  <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
fileName <- "exdata_data_NEI_data.zip" 

if(!file.exists(fileName))
{
  download.file(fileUrl,destfile=fileName)
}
unzip(fileName)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Sum total number of emissions per year and type, but filter for Baltimore City only
# ------------------------------------------------------------------------------------
dataToPlot <- aggregate(Emissions ~ year+type, data=NEI[NEI$fips == "24510",], FUN=sum)
names(dataToPlot) <- c("Year","Type","Emissions")

# Plot 3 
# ------------------------------------------------------------------------------------
library(ggplot2)
png("plot3.png", width=800, height=640, units = "px")
g <- ggplot(dataToPlot, aes(Year, Emissions)) + 
  geom_line(aes(color = Type))  +
  geom_point(aes(color = Type, shape=Type), size=4) +
  scale_x_continuous(breaks=c(1999,2002,2005,2008)) + 
  ylab(expression(paste("PM25 Emissions in TONS"))) + xlab("Year") +
  ggtitle(expression(paste("Total Number of PM25 Emissions per Type in Baltimore City")))

print(g)
dev.off()
