powerData <- read.table(pipe("grep -E 'Date|^1/2/2007|^2/2/2007' household_power_consumption.txt"), 
                        header = TRUE, sep = ";", quote = "", dec = ".", na.strings = "?")