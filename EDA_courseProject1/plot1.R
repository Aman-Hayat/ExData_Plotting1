# Download and unzip the data if it doesn't exist
if(!file.exists("household_power_consumption.txt")) {
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
  unzip(temp)
  unlink(temp)
}

# Read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

# Subset data for the two specific dates
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Open PNG device
png("plot1.png", width=480, height=480)

# Create Plot 1
hist(sub_data$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# Close device
dev.off()