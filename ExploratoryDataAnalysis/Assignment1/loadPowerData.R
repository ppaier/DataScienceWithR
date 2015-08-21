
# Step 1: define paths, download and unzip data
#----------------------------------------------------------------------------------------------------------
# define URL of file, path where it should be saved and the names of the data files
fileUrl  <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileName <- "household_power_consumption.zip"
dataName <- "household_power_consumption.txt"

# download zip file and unzip it (only if it doesn't exist already)
if(!file.exists(fileName))
{
    download.file(fileUrl,destfile=fileName)
}
unzip(fileName, overwrite = FALSE)


# Step 2: load data, take only data from two days and combine Date and Time to Timestamp using lubridate
#----------------------------------------------------------------------------------------------------------
library(lubridate)

data <- read.csv2(dataName, stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format= "%d/%m/%Y")

day1 <- as.Date("2007-02-01")
day2 <- as.Date("2007-02-02")
data <- data[data$Date==day1 | data$Date==day2,]

dataTidy <- cbind(data.frame(TimeStamp=ymd_hms(paste(data$Date, data$Time, sep=' '), tz="CET")), 
                  sapply(data[-c(1,2)],function(a) { as.numeric(a) }))

