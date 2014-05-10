#open, subset and data conversion
table <- read.csv("household_power_consumption.txt", sep=";")
table$Date <- strptime(table$Date, "%d/%m/%Y")
table$Date <- as.Date(table$Date)
range_inf <- as.Date(strptime("2007-02-01", "%Y-%m-%d"))
range_sup <- as.Date(strptime("2007-02-02", "%Y-%m-%d"))
table <- subset(table, table$Date >= range_inf & table$Date <= range_sup)
#plot

png("plot3.png", height = 480, width = 480, bg = "transparent")
plot(ts(as.numeric(as.character(table$Sub_metering_1))), type = "n", xaxt = "n", ylab = "Energy sub metering", xlab = "")
#lines
lines(ts(as.numeric(as.character(table$Sub_metering_1))), col = "black")
lines(ts(as.numeric(as.character(table$Sub_metering_2))), col = "red")
lines(ts(as.numeric(as.character(table$Sub_metering_3))), col = "blue")
#sets axis value
axis(1, labels = "Thu", at = 0)
axis(1, labels = "Fri", at = 1441)
axis(1, labels = "Sat", at = 2880)
legend("topright", lty=c(1,1), col = c("black" ,"blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()