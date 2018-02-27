##########
# PLOT 1 #
##########

# Read whole data.
data <- read.table(".//household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Subset data from the dates 2007-02-01 and 2007-02-02.
subset <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

# Convert Date variable to Date class.
subset$Date <- as.Date(subset$Date, "%d/%m/%Y")

# Save to a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot1.png", width = 480, height = 480)

# Construct Plot 1.
hist(subset$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     col = "red")

# Close file device.
dev.off()