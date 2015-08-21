
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


# Sum total number of emissions per year, but filter for Coal Combustion related ones only
# ------------------------------------------------------------------------------------
# first find the coal combustion related SCC codes
coalSCC <- SCC[which(grepl("coal", SCC$Short.Name, ignore.case = TRUE)),]

# by merging the SCC Coal data with NEI data, the NEI data, that is not coal related
# is discared
NEICoal <- merge(x=NEI, y=coalSCC, by="SCC")

dataToPlot <- aggregate(Emissions ~ year, data=NEICoal, FUN=sum)
names(dataToPlot) <- c("Year","Emissions")

# Plot 4 
# ------------------------------------------------------------------------------------
library(ggplot2)
png("plot4.png", width=800, height=640, units = "px")

g <- ggplot(dataToPlot, aes(Year, Emissions/1000)) + 
    geom_line()  +
    geom_point(size=5, color='blue') +
    scale_x_continuous(breaks=c(1999,2002,2005,2008)) + 
    scale_y_continuous(limits=c(300,650)) +
    ylab(expression(paste("PM25 Emissions in KILO-TONS"))) + xlab("Year") +
    geom_text(aes(label=round(Emissions/1000)), size=4, vjust=3) +
    theme(legend.position='none') +
    ggtitle(expression(paste("Total Number of PM25 Emissions from Coal Combustions in the U.S.")))

print(g)
dev.off()


