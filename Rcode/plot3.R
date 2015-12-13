power <- read.table("./data/household_power_consumption.txt",sep = ";",header = TRUE)
power$Date <- as.Date(as.character(power$Date), "%d/%m/%Y")
pdata <- subset(power,Date >= "2007-02-01" & Date <= "2007-02-02")
pdata$Global_active_power <- as.numeric(as.character(pdata$Global_active_power))
pdata$Time <- as.ts(as.character(pdata$Time))
pdata$datetime <- as.POSIXct(paste(pdata$Date, pdata$Time), format="%Y-%m-%d %H:%M:%S")

Sys.setlocale("LC_TIME", "English")

pdata$Sub_metering_1 <- as.numeric(as.character(pdata$Sub_metering_1))
pdata$Sub_metering_2 <- as.numeric(as.character(pdata$Sub_metering_2))
pdata$Sub_metering_3 <- as.numeric(as.character(pdata$Sub_metering_3))

par(mfrow = c(1,1),mar = c(2,5,1,2))

plot(pdata$datetime,pdata$Sub_metering_1,type = "n",xlab = "", ylab = "Energy sub metering",yaxt = "n")
axis(2,at = c(0,10,20,30))
lines(pdata$datetime,pdata$Sub_metering_1,lwd = 0.15)
lines(pdata$datetime,pdata$Sub_metering_2,lwd = 0.15,col = "red")
lines(pdata$datetime,pdata$Sub_metering_3,lwd = 0.15,col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = 0.2, col = c("black","red","blue"))

dev.copy(png,file = "plot3.png")
dev.off()
