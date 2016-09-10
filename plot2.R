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

#plotting plot2
png("plot2.png", width=480, height=480)
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(datetime, subpower$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#closing device
dev.off()