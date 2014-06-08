powerData <- read.table(pipe("grep -E 'Date|^1/2/2007|^2/2/2007' household_power_consumption.txt"), 
                        header = TRUE, sep = ";", quote = "", dec = ".", na.strings = "?")
with(powerData, hist(Global_active_power, col = "Red", 
                     main = "Global Active Power", 
                     xlab = "Global Active Power (kilowatts)", 
                     ylab = "Frequency"))
dev.copy(png, file = "plot1.png")
dev.off()