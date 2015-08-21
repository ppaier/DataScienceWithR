
# Step 1: download, load and prepare data
# script loadPowerData is in the same repository
#----------------------------------------------------------------------------------------------------------
source("loadPowerData.R")


# Step 2: make  plot Nr 1 and save it in the current working directory
#----------------------------------------------------------------------------------------------------------
png("plot1.png", width=504, height=504, units = "px")
hist(dataTidy$Global_active_power, main = "Global Active Power", 
     col="red", xlab= "Global Active Power (kilowatts)")

dev.off()

