
# Load an prepare the data
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


# Sum total number of emissions per year, but filter for Baltimore City and LA
# and motor vehicle related sources. I assume that motor vehicle related sources
# are indicated by type = ON-ROAD. After reading the NEI documentation, this seems
# like a valid choice. See: 
# http://www.epa.gov/ttn/chief/net/2008inventory.html#inventorydoc
# under "Description of NEI Data Categories"
# ------------------------------------------------------------------------------------
dataToPlot <- aggregate(Emissions ~ year + fips, 
                        data=NEI[ (NEI$fips == "24510" | NEI$fips == "06037") & (NEI$type == "ON-ROAD"),], 
                        FUN=sum)
names(dataToPlot) <- c("Year","Fips","Emissions")

# Plot 6
# ------------------------------------------------------------------------------------
# plot data and add regression lines
library(ggplot2)
png("plot6.png", width=800, height=640, units = "px")

g <- ggplot(dataToPlot, aes(Year, Emissions)) + 
    geom_line(aes(color = Fips))  +
    geom_point(size=5,aes(color = Fips, shape = Fips)) +
    geom_smooth(aes(color = Fips), method = "lm", se = FALSE) +
    scale_x_continuous(breaks=c(1999,2002,2005,2008)) + 
    scale_y_continuous(limits=c(0,5000)) +
    ylab(expression(paste("PM25 Emissions in TONS"))) + xlab("Year") +
    geom_text(aes(label=round(Emissions)), size=4, vjust=-3) +
    ggtitle(expression(paste("Total Number of PM25 Emissions from Motor Vehicles in Baltimore City and LA"))) +
    scale_shape_discrete(name="City", breaks=c("06037","24510"), labels=c("LA", "Baltimore City")) +
    scale_colour_discrete(name="City", breaks=c("06037","24510"), labels=c("LA", "Baltimore City"))

print(g)
dev.off()

