power <- read.table("./data/household_power_consumption.txt",sep = ";",header = TRUE)
power$Date <- as.Date(as.character(power$Date), "%d/%m/%Y")
pdata <- subset(power,Date >= "2007-02-01" & Date <= "2007-02-02")
pdata$Global_active_power <- as.numeric(as.character(pdata$Global_active_power))
pdata$Time <- as.ts(as.character(pdata$Time))
pdata$datetime <- as.POSIXct(paste(pdata$Date, pdata$Time), format="%Y-%m-%d %H:%M:%S")
##Set location
Sys.setlocale("LC_TIME", "English")

par(mfrow = c(2,2),mar = c(2,2,0,1))
##lefttop
plot(pdata$datetime,pdata$Global_active_power,type = "n",xlab = "",ylab = "Global Active Power (kilowatts)")
lines(pdata$datetime,pdata$Global_active_power)
##righttop
pdata$Voltage <- as.numeric(as.character(pdata$Voltage))
plot(pdata$datetime,pdata$Voltage,type = "n",xlab = "datetime",ylab = "Voltage")
lines(pdata$datetime,pdata$Voltage)
##leftbottom
plot(pdata$datetime,pdata$Sub_metering_1,type = "n",xlab = "", ylab = "Energy sub metering",yaxt = "n")
lines(pdata$datetime,pdata$Sub_metering_1,lwd = 0.15)
lines(pdata$datetime,pdata$Sub_metering_2,lwd = 0.15,col = "red")
lines(pdata$datetime,pdata$Sub_metering_3,lwd = 0.15,col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = 0.2, col = c("black","red","blue"),bty = "n")
axis(2,at = c(0,10,20,30))
##rightbottom
pdata$Global_reactive_power <- as.numeric(as.character(pdata$Global_reactive_power))
plot(pdata$datetime,pdata$Global_reactive_power,type = "n",xlab = "datetime",ylab = "Global_reactive_power",yaxt = "n")
lines(pdata$datetime,pdata$Global_reactive_power)
axis(2,at = seq(0,0.5,by = 0.1),las = 2)

dev.copy(png,file = "plot4.png")
dev.off()