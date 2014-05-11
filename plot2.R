# plot2.R - Global Active Power vs Time

# Read data
data <- read.table('../household_power_consumption.txt', sep=';',
                    header=T, colClasses = c('character', 'character',
                    'numeric', 'numeric', 'numeric', 'numeric', 'numeric',
                    'numeric', 'numeric'), na.strings='?')

# Convert dates
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Get subset on two days in February, 2007
data <- subset(data, as.Date(DateTime) >= as.Date("2007-02-01") &
                as.Date(DateTime) <= as.Date("2007-02-02"))

# Open plot2.png
png("plot2.png", height=480, width=480)

# Build graph global active power vs time
plot(data$DateTime,
    data$Global_active_power,
    pch=NA,
    xlab="",
    ylab="Global Active Power (kilowatts)")

# Draw the line
lines(data$DateTime, data$Global_active_power)

# Close PNG file
dev.off()
