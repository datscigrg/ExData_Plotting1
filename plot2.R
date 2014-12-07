dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globActPow <- as.numeric(dataSubset$Global_active_power)
dt <- data.frame("Date.Time" = paste(data$Date, data$Time, sep = " "))
#dateTime <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
dateTime <- strptime(dt, "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(dateTime, globActPower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()