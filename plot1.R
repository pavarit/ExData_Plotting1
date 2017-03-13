##This script read household power data, extract only for 2/1/2007 and 2/2/2007, then plot charts

##Read and convert data
rawdt <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")
datetime <- strptime(paste(rawdt$Date, rawdt$Time), format = "%d/%m/%Y %H:%M:%S")
rawdt[, 3:ncol(rawdt)] <- sapply(rawdt[, 3:ncol(rawdt)], as.numeric)
dt <- cbind(datetime, rawdt[, 3:ncol(rawdt)])

##Extract only for 2 dates
dtsub <- dt[rawdt$Date == "1/2/2007" | rawdt$Date == "2/2/2007", ]

##plot1
png(filename = "plot1.png")

hist(dtsub$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()