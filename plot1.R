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

#plotting plot1
png(filename = 'plot1.png', width = 480, height = 480, units='px')
hist(subpower$Global_active_power, xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power', col = 'red')

#closing device
dev.off()