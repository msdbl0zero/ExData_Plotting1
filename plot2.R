
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

#data_filtered$weekdays <- weekdays(as.Date(data_filtered$DateTime))
png("plot2.png", height=480, width=480)
plot( data_filtered$Global_active_power ~ data_filtered$DateTime,
      xlab="", ylab="Gloabal Active Power (kilowatts)", type="l")
dev.off()

