file_name <- "household_power_consumption.txt"
dt<-fread(file_name, sep=";", skip=grep("31/1/2007;23:59:00", readLines(file_name)), nrows=2880)
names(dt) <- colnames(fread(file_name, nrows=0))
dt$Date <- as.Date(dt$Date, "%d/%m/%Y")
date_time <- strptime(paste(dt$Date, dt$Time), "%Y-%m-%d %H:%M:%S")

##plot4
par(mfrow=c(2,2))
plot(date_time, dt$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", pch=20, cex=0)
lines(date_time, dt$Global_active_power, lty=1, lwd=1)

plot(date_time, dt$Voltage, xlab="datetime", ylab="Voltage", pch=20, cex=0)
lines(date_time, dt$Voltage, lty=1, lwd=1)

plot(date_time, dt$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(date_time, dt$Sub_metering_1, col="black", lty=1, lwd=1)
lines(date_time, dt$Sub_metering_2, col="red", lty=1, lwd=1)
lines(date_time, dt$Sub_metering_3, col="blue", lty=1, lwd=1)
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1), lwd=c(2.5,2.5, 2.5))

plot(date_time, dt$Global_reactive_power, xlab="datetime", ylab="Global reactive power", pch=20, cex=0)
lines(date_time, dt$Global_reactive_power, lty=1, lwd=1)

dev.copy(png, "plot4.png")
dev.off()