##########
# PLOT 2 #
##########

# Read whole data.
data <- read.table(".//household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Subset data from the dates 2007-02-01 and 2007-02-02.
subset <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

# Convert Date and Time variables to Date/Time class.
date_time <- strptime(paste(subset$Date, subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Create a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot2.png", width = 480, height = 480)

# Construct Plot 2.
plot(date_time, subset$Global_active_power,
     type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

# Close file device.
dev.off()