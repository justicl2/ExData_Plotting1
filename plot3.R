library(lubridate)

# Read in dataset
power <- read.csv("~/Coursera/Exploratory Data Analysis/Course Project 1/household_power_consumption.txt", 
                  sep=";", na.strings="?", stringsAsFactors=FALSE)

# Subset dataset to dates of interest
power2 <- subset(power, Date == '2/2/2007' | Date == '1/2/2007')

# Convert Date and Time variables from character to appropriate formats
power2$Date <- dmy(power2$Date)
power2$Time <- hms(power2$Time)

# Create plot

# Plot without data or x axis label/tick marks - to be added
plot(power2$Sub_metering_1, type = 'n', 
     ylab = "Energy sub-metering",
     xlab = "",
     xaxt = "n") 

# Create x axis tick marks with days of week at appropriate places
# 'Thurs' - first data point
# 'Fri' - first data point where Date = '2007-02-02'
# 'Sat' - last data point
axis(side = 1, at = c(1, min(which(power2$Date == '2007-02-02')), length(power2$Sub_metering_1)),
     labels = c("Thurs", "Fri", "Sat"))

# Add in data lines
lines(power2$Sub_metering_1, col = "black")
lines(power2$Sub_metering_2, col = "red")
lines(power2$Sub_metering_3, col = "blue")

# Create legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("black", "red", "blue"), cex = 0.8)


# Save graph as PNG file
dev.copy(png, "plot3.png")
dev.off()
