if(!file.exists("household_power_consumption.txt")) {
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
  unzip(temp)
  unlink(temp)
}

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
sub_data$DateTime <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(sub_data$DateTime, sub_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()