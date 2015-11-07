
# read data
require(data.table)
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, "household_power_consumption.zip", method = "curl", mode="wb")
unzip("household_power_consumption.zip", files = NULL, list = FALSE, overwrite = TRUE, junkpaths = FALSE, exdir = ".", unzip = "internal", setTimes = FALSE)

# for fast reading data
data <- fread("household_power_consumption.txt")
# subset data only for days needed to analyze
data_filtered <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

library(lubridate)
data_filtered$DateTime <- dmy_hms(paste(data_filtered$Date, data_filtered$Time))

png("plot3.png", height=480, width=480)
with(data_filtered, plot(DateTime, Sub_metering_1,type = "l", xlab="", ylab="Energy Sub Metering"))
with(data_filtered, lines(DateTime, Sub_metering_2, col = "red"))
with(data_filtered, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()

