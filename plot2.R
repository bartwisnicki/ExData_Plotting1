# Script for creating the plot 2

# Reading the data
data <- read.table("household_power_consumption.txt", sep = ";", header = T, dec = ".",
                   stringsAsFactors = F)
# Switching date variable
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subsetting the relevant table
my_data <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

# Switching time variable
x <- paste(my_data$Date, my_data$Time)
my_data$Time <- strptime(x, format = "%Y-%m-%d %H:%M:%S")

# Plotting 
png(filename = "plot2.png")
plot(my_data$Time, my_data$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
