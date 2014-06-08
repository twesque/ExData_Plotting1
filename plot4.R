powerData <- read.table(pipe("grep -E 'Date|^1/2/2007|^2/2/2007' household_power_consumption.txt"), 
                        header = TRUE, sep = ";", quote = "", dec = ".", na.strings = "?", stringsAsFactors = FALSE)
powerData <- transform(powerData, Date = strptime(paste(powerData$Date, powerData$Time, sep = " "), format = "%d/%m/%Y %T"))
opar <- par()
par(mfrow = c(2, 2))
par(cex = 0.6)

## Top left - Date v Global Active Power
with(powerData, plot(Date, Global_active_power, ylab = "Global Active Power (kilowatts)", type = "n"))
with(powerData, lines(Date, Global_active_power))

## Top right - Date v voltage
with(powerData, plot(Date, Voltage, xlab = "datetime", type = "n"))
with(powerData, lines(Date, Voltage))

## Bottom left - Date v Sub metering
with(powerData, plot(c(Date, Date, Date), c(Sub_metering_1, Sub_metering_2, Sub_metering_3), 
                     ylab = "Energy sub metering", xlab = " ", type = "n"))
with(powerData, lines(Date, Sub_metering_1, col = "black"))
with(powerData, lines(Date, Sub_metering_2, col = "red"))
with(powerData, lines(Date, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty=c(1, 1, 1), lwd=c(2.5, 2.5, 2.5), col=c("black", "red", "blue"))

## Bottom right - Date v Global Reactive Power
with(powerData, plot(Date, Global_reactive_power, xlab = "datetime", type = "n"))
with(powerData, lines(Date, Global_reactive_power))

dev.copy(png, file = "plot4.png")
dev.off()

suppressWarnings(par(opar))