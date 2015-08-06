# Script for creating the plot 1

# Reading the data
data <- read.table("household_power_consumption.txt", sep = ";", header = T, dec = ".",
                   stringsAsFactors = F)

# Switching date variable
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subsetting the relevant table
my_data <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

# Switching from string to numeric
my_data$Global_active_power <- as.numeric(my_data$Global_active_power)

# Making histogram
png(filename = "plot1.png")
hist(my_data$Global_active_power, freq = T, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)") 
dev.off()
