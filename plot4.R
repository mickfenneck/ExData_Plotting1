#open, subset and data conversion
table <- read.csv("household_power_consumption.txt", sep=";")
table$Date <- strptime(table$Date, "%d/%m/%Y")
table$Date <- as.Date(table$Date)
range_inf <- as.Date(strptime("2007-02-01", "%Y-%m-%d"))
range_sup <- as.Date(strptime("2007-02-02", "%Y-%m-%d"))
table <- subset(table, table$Date >= range_inf & table$Date <= range_sup)
#plots
png("plot4.png", height = 480, width = 480, bg = "transparent")
#sets to 2x2 plot matrix
par(mfrow=c(2,2))
#plot1
plot(ts(as.numeric(as.character(table$Global_active_power))), xaxt = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
#sets the axis values
axis(1, labels = "Thu", at = 0)
axis(1, labels = "Fri", at = 1441)
axis(1, labels = "Sat", at = 2880)
#plot2
plot(ts(as.numeric(as.character(table$Voltage))), xaxt = "n", ylab = "Voltage", xlab = "datetime")
#sets the axis values
axis(1, labels = "Thu", at = 0)
axis(1, labels = "Fri", at = 1441)
axis(1, labels = "Sat", at = 2880)
#plot3
plot(ts(as.numeric(as.character(table$Sub_metering_1))), type = "n", xaxt = "n", ylab = "Energy sub metering", xlab = "")
lines(ts(as.numeric(as.character(table$Sub_metering_1))), col = "black")
lines(ts(as.numeric(as.character(table$Sub_metering_2))), col = "red")
lines(ts(as.numeric(as.character(table$Sub_metering_3))), col = "blue")
#sets the axis values
axis(1, labels = "Thu", at = 0)
axis(1, labels = "Fri", at = 1441)
axis(1, labels = "Sat", at = 2880)
legend("topright", lty=c(1,1), col = c("black" ,"blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd = 0, box.col = "transparent",bg = "transparent")
#plot4
plot(ts(as.numeric(as.character(table$Global_reactive_power))), xaxt = "n", ylab = "Global_reactive_power", xlab = "datetime")
#sets the axis values
axis(1, labels = "Thu", at = 0)
axis(1, labels = "Fri", at = 1441)
axis(1, labels = "Sat", at = 2880)
dev.off()