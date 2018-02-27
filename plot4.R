##########
# PLOT 4 #
##########

# Read whole data.
data <- read.table(".//household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Subset data from the dates 2007-02-01 and 2007-02-02.
subset <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

# Convert Date and Time variables to Date/Time class.
date_time <- strptime(paste(subset$Date, subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Save to a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot4.png", width = 480, height = 480)

# Construct Plot 4.
par(mfrow = c(2,2))
# Graph 1
plot(date_time, subset$Global_active_power,
     type = "l",
     xlab = "", ylab = "Global Active Power")
# Graph 2
plot(date_time, subset$Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")
# Graph 3
plot(date_time, subset$Sub_metering_1,
     type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(date_time, subset$Sub_metering_2,
      col = "red")
lines(date_time, subset$Sub_metering_3,
      col = "blue")
legend("topright",
       lty = 1, lwd = 3,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Graph 4
plot(date_time, subset$Global_reactive_power,
     type = "l",
     xlab = "datetime", ylab = "Global Reactive Power")

# Close file device.
dev.off()