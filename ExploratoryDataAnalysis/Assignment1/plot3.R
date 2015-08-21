
# Step 1: download, load and prepare data
# script loadPowerData is in the same repository
#----------------------------------------------------------------------------------------------------------
source("loadPowerData.R")


# Step 2: make  plot Nr 3 and save it in the current working directory
#----------------------------------------------------------------------------------------------------------
png("plot3.png", width=504, height=504, units = "px")

with(dataTidy, plot(TimeStamp, Sub_metering_1, xlab="", ylab="Energy sub metering", type = "n"))

with(dataTidy, points(TimeStamp, Sub_metering_1, type = "l"))
with(dataTidy, points(TimeStamp, Sub_metering_2, col = "red", type = "l"))
with(dataTidy, points(TimeStamp, Sub_metering_3, col = "blue", type = "l"))
legend("topright", lwd=1, lty=1 , col = c("black", "red", "blue"), legend = names(dataTidy[,c(6,7,8)]))

dev.off()
