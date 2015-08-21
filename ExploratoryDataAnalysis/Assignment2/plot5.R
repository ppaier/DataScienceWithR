
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


# Sum total number of emissions per year, but filter for Baltimore City 
# and motor vehicle related sources. I assume that motor vehicle related sources
# are indicated by type = ON-ROAD. After reading the NEI documentation, this seems
# like a valid choice. See: 
# http://www.epa.gov/ttn/chief/net/2008inventory.html#inventorydoc
# under "Description of NEI Data Categories"
# ------------------------------------------------------------------------------------
dataToPlot <- aggregate(Emissions ~ year, data=NEI[ (NEI$fips == "24510") & (NEI$type == "ON-ROAD"),], 
                        FUN=sum)
names(dataToPlot) <- c("Year","Emissions")

# Plot 5
# ------------------------------------------------------------------------------------
library(ggplot2)
png("plot5.png", width=800, height=640, units = "px")

g <- ggplot(dataToPlot, aes(Year, Emissions)) + 
    geom_line()  +
    geom_point(size=5, color='blue') +
    scale_x_continuous(breaks=c(1999,2002,2005,2008)) + 
    scale_y_continuous(limits=c(0,350)) +
    ylab(expression(paste("PM25 Emissions in TONS"))) + xlab("Year") +
    geom_text(aes(label=round(Emissions)), size=4, vjust=3) +
    theme(legend.position='none') +
    ggtitle(expression(paste("Total Number of PM25 Emissions from Motor Vehicles in Baltimore City")))

print(g)
dev.off()


