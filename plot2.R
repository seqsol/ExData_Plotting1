file_name <- "household_power_consumption.txt"
dt<-fread(file_name, sep=";", skip=grep("31/1/2007;23:59:00", readLines(file_name)), nrows=2880)
names(dt) <- colnames(fread(file_name, nrows=0))
dt$Date <- as.Date(dt$Date, "%d/%m/%Y")
date_time <- strptime(paste(dt$Date, dt$Time), "%Y-%m-%d %H:%M:%S")

## plot2
plot(date_time, dt$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", pch=20, cex=0)
lines(date_time, dt$Global_active_power, lty=1, lwd=1)
dev.copy(png, "plot2.png")
dev.off()
