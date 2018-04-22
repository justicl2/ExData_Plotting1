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
plot(power2$Global_active_power, type = 'n', 
       ylab = "Global Active Power (kilowatts)",
       xlab = "",
       xaxt = "n") 

# Create x axis tick marks with days of week at appropriate places
# 'Thurs' - first data point
# 'Fri' - first data point where Date = '2007-02-02'
# 'Sat' - last data point
axis(side = 1, at = c(1, min(which(power2$Date == '2007-02-02')), length(power2$Global_active_power)),
     labels = c("Thurs", "Fri", "Sat"))

# Add in data line
lines(power2$Global_active_power)


# Save graph as PNG file
dev.copy(png, 'plot2.png')
dev.off()