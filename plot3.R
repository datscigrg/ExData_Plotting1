dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
dt <- data.frame("Date.Time" = paste(data$Date, data$Time, sep = " "))
dateTime <- strptime(dt, "%d/%m/%Y %H:%M:%S")
subMeter1 <- as.numeric(dataSubset$Sub_metering_1)
subMeter2 <- as.numeric(dataSubset$Sub_metering_2)
subMeter3 <- as.numeric(dataSubset$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(dateTime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMeter2, type="l", col="red")
lines(dateTime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()