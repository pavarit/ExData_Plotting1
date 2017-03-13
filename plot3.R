##This script read household power data, extract only for 2/1/2007 and 2/2/2007, then plot charts

##Read and convert data
rawdt <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")
datetime <- strptime(paste(rawdt$Date, rawdt$Time), format = "%d/%m/%Y %H:%M:%S")
rawdt[, 3:ncol(rawdt)] <- sapply(rawdt[, 3:ncol(rawdt)], as.numeric)
dt <- cbind(datetime, rawdt[, 3:ncol(rawdt)])

##Extract only for 2 dates
dtsub <- dt[rawdt$Date == "1/2/2007" | rawdt$Date == "2/2/2007", ]

##plot3
png(filename = "plot3.png")

plot(Sub_metering_1 ~ datetime, dtsub, type = "n", xlab = "", ylab = "Energy sub metering")
lines(Sub_metering_1 ~ datetime, dtsub, col = "black")
lines(Sub_metering_2 ~ datetime, dtsub, col = "red")
lines(Sub_metering_3 ~ datetime, dtsub, col = "blue")

legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

dev.off()