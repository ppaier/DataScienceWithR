
# Step 1: download, load and prepare data
# script loadPowerData is in the same repository
#----------------------------------------------------------------------------------------------------------
source("loadPowerData.R")


# Step 2: make  plot Nr 2 and save it in the current working directory
#----------------------------------------------------------------------------------------------------------
png("plot2.png", width=504, height=504, units = "px")
with(dataTidy, plot(TimeStamp, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()
