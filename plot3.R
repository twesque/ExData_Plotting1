powerData <- read.table(pipe("grep -E 'Date|^1/2/2007|^2/2/2007' household_power_consumption.txt"), 
                        header = TRUE, sep = ";", quote = "", dec = ".", na.strings = "?", stringsAsFactors = FALSE)
powerData <- transform(powerData, Date = strptime(paste(powerData$Date, powerData$Time, sep = " "), format = "%d/%m/%Y %T"))
with(powerData, plot(c(Date, Date, Date), c(Sub_metering_1, Sub_metering_2, Sub_metering_3), 
                     ylab = "Energy sub metering", xlab = "", type = "n"))
with(powerData, lines(Date, Sub_metering_1, col = "black"))
with(powerData, lines(Date, Sub_metering_2, col = "red"))
with(powerData, lines(Date, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty=c(1, 1, 1), lwd=c(2.5, 2.5, 2.5), col=c("black", "red", "blue"))
dev.copy(png, file = "plot3.png")
dev.off()