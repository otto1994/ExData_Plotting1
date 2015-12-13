power <- read.table("./data/household_power_consumption.txt",sep = ";",header = TRUE)
power$Date <- as.Date(as.character(power$Date), "%d/%m/%Y")
pdata <- subset(power,Date >= "2007-02-01" & Date <= "2007-02-02")
pdata$Global_active_power <- as.numeric(as.character(pdata$Global_active_power))
##read the data using steps in plot1.R, but convert pdata$Global_active_power into numeric for convenience
pdata$Time <- as.ts(as.character(pdata$Time))
pdata$datetime <- as.POSIXct(paste(pdata$Date, pdata$Time), format="%Y-%m-%d %H:%M:%S")
##Since my location is at Taiwan (ZT="GMT",using Chinese), which would cause the plotting system work differently on counting weekdays and displaying language in graphs, use "Sys.setlocale" to reconcile the time zone and language.
Sys.setlocale("LC_TIME", "English")

par(mfrow = c(1,1),mar = c(2,5,1,2))
plot(pdata$datetime,pdata$Global_active_power,type = "n",xlab = "",ylab = "Global Active Power (kilowatts)")
lines(pdata$datetime,pdata$Global_active_power)

dev.copy(png,file = "plot2.png")
dev.off()
