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

hist(power2$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col = "red")


# Save graph as PNG file
dev.copy(png, "plot1.png")
dev.off()
