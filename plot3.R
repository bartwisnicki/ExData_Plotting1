# Script for creating the plot 3

# Reading the data
data <- read.table("household_power_consumption.txt", sep = ";", header = T, dec = ".",
                   stringsAsFactors = F)
# Switching date variable
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
# Subsetting the relevant table
my_data <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

# Switching date and time variables
x <- paste(my_data$Date, my_data$Time)
my_data$Time <- strptime(x, format = "%Y-%m-%d %H:%M:%S")

# Plotting
png(filename = "plot3.png")
plot(my_data$Time, my_data$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xlab = "")
lines(my_data$Time, my_data$Sub_metering_2, type = "l", col = "red")
lines(my_data$Time, my_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = paste("Sub_metering_", 1:3), col = c("black", "red", "blue"),
       lty = 1)
dev.off()

