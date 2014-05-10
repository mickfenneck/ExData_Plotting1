#open, subset and data conversion
table <- read.csv("household_power_consumption.txt", sep=";")
table$Date <- strptime(table$Date, "%d/%m/%Y")
table$Date <- as.Date(table$Date)
range_inf <- as.Date(strptime("2007-02-01", "%Y-%m-%d"))
range_sup <- as.Date(strptime("2007-02-02", "%Y-%m-%d"))
table <- subset(table, table$Date >= range_inf & table$Date <= range_sup)
#plot
png("plot2.png", height = 480, width = 480, bg = "transparent")
plot(ts(as.numeric(as.character(table$Global_active_power))), xaxt = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
#sets the axis values
axis(1, labels = "Thu", at = 0)
axis(1, labels = "Fri", at = 1441)
axis(1, labels = "Sat", at = 2880)
dev.off()