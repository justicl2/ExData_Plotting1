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
# Partition and adjust margins
par(mfrow = c(2,2), mar = c(4,4,1,2))

### Create plot
### All plots follow the same process: 

### 1. Create empty plot with no x-axis tick marks
### 2. Add in x-axis tick marks at appropriate places
###    'Thurs' - first data point
###    'Fri' - first data point where Date = '2007-02-02'
###    'Sat' - last data point
### 3. Add in data lines


## Top left
# Create empty plot with no x-axis tick marks
plot(power2$Global_active_power, 
     ylab = "Global Active Power", 
     xlab = "", 
     xaxt = "n", 
     type = "n")

# Add in x-axis tick marks
axis(side = 1, at = c(1, min(which(power2$Date == '2007-02-02')), length(power2$Global_active_power)),
       labels = c("Thurs", "Fri", "Sat"))

lines(power2$Global_active_power)




## Top right

plot(power2$Voltage, 
     ylab = "Voltage", 
     xlab = "datetime", 
     xaxt = "n", 
     type = "n")

axis(side = 1, at = c(1, min(which(power2$Date == '2007-02-02')), length(power2$Voltage)),
     labels = c("Thurs", "Fri", "Sat"))

lines(power2$Voltage)



## Bottom left
plot(power2$Sub_metering_1, type = 'n', 
     ylab = "Energy sub-metering",
     xlab = "",
     xaxt = "n") 

axis(side = 1, at = c(1, min(which(power2$Date == '2007-02-02')), length(power2$Sub_metering_1)),
     labels = c("Thurs", "Fri", "Sat"))

lines(power2$Sub_metering_1, col = "black")
lines(power2$Sub_metering_2, col = "red")
lines(power2$Sub_metering_3, col = "blue")

# Add in legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n", cex = 0.7)




## Bottom right
plot(power2$Global_reactive_power, type = 'n',
     ylab = "Global_reactive_power",
     xlab = "datetime",
     xaxt = "n") 

axis(side = 1, at = c(1, min(which(power2$Date == '2007-02-02')), length(power2$Global_reactive_power)),
     labels = c("Thurs", "Fri", "Sat"))

lines(power2$Global_reactive_power)


# Save graph as PNG file
dev.copy(png, "plot4.png")
dev.off()