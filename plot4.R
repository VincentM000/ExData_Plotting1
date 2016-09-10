#downloading data
zip.file.location <- "https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip"
f <- file.path(getwd(), "household_power_consumption.zip")
download.file(zip.file.location, f, mode = "wb")
unzip("household_power_consumption.zip")

#reading data
power <- read.table(file = "household_power_consumption.txt", header = TRUE, sep =";", na.strings = '?')

#subsetting data
subpower <- subset(power, power$Date %in% c("1/2/2007" , "2/2/2007"))

#converting data
subpower$Global_active_power <- as.numeric(subpower$Global_active_power)
datetime <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(subpower$Sub_metering_1)
subMetering2 <- as.numeric(subpower$Sub_metering_2)
subMetering3 <- as.numeric(subpower$Sub_metering_3)

#plotting plot4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, subpower$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, subpower$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1, bty = "n")
plot(datetime, subpower$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#closing device
dev.off()