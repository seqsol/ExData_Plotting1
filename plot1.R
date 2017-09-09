file_name <- "household_power_consumption.txt"
dt<-fread(file_name, sep=";", skip=grep("31/1/2007;23:59:00", readLines(file_name)), nrows=2880)
names(dt) <- colnames(fread(file_name, nrows=0))
dt$Date <- as.Date(dt$Date, "%d/%m/%Y")
date_time <- strptime(paste(dt$Date, dt$Time), "%Y-%m-%d %H:%M:%S")

##plot1
hist(dt$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, "plot1.png")
dev.off()