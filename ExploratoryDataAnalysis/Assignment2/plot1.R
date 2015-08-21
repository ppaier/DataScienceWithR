
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

# Sum total number of emissions per year
# ------------------------------------------------------------------------------------
dataToPlot <- aggregate(Emissions ~ year, data=NEI, FUN=sum)
names(dataToPlot) <- c("Year","Emissions")

# Plot 1 
# ------------------------------------------------------------------------------------
# plot data and add regression lines
png("plot1.png", width=800, height=640, units = "px")
with(dataToPlot, plot(Year, Emissions/1000, col="blue", 
                            type ="o", pch=16, xaxt="n", 
                            ylab = expression(paste("PM25 Emissions in KILO-TONS")), 
                            main = expression(paste("Total Number of PM25 Emissions in the U.S."))))
axis(side = 1, at = c(1999,2002,2005,2008))
# add regression line
model <- lm(Emissions/1000 ~ Year, dataToPlot)
abline(model)
dev.off()
