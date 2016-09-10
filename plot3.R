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

#plotting plot3
png("plot3.png", width=480, height=480)
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(datetime, subpower$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(datetime, subpower$Sub_metering_2, col = 'red')
lines(datetime, subpower$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)

#close device
dev.off()
