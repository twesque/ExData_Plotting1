powerData <- read.table(pipe("grep -E 'Date|^1/2/2007|^2/2/2007' household_power_consumption.txt"), 
                        header = TRUE, sep = ";", quote = "", dec = ".", na.strings = "?", stringsAsFactors = FALSE)
powerData <- transform(powerData, Date = strptime(paste(powerData$Date, powerData$Time, sep = " "), format = "%d/%m/%Y %T"))
with(powerData, plot(Date, Global_active_power, ylab = "Global Active Power (kilowatts)", type = "n"))
with(powerData, lines(Date, Global_active_power))
dev.copy(png, file = "plot2.png")
dev.off()