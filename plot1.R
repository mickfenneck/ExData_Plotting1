#open, subset and data conversion
table <- read.csv("household_power_consumption.txt", sep=";")
table$Date <- strptime(table$Date, "%d/%m/%Y")
table$Date <- as.Date(table$Date)
range_inf <- as.Date(strptime("2007-02-01", "%Y-%m-%d"))
range_sup <- as.Date(strptime("2007-02-02", "%Y-%m-%d"))
table <- subset(table, table$Date >= range_inf & table$Date <= range_sup)
#plot
png("plot1.png", height = 480, width = 480, bg = "transparent")
hist(as.numeric(as.character(table$Global_active_power)), main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.off()