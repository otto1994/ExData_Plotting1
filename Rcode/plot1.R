power <- read.table("./data/household_power_consumption.txt",sep = ";",header = TRUE)
##Since the type of vector of power$Date is factor, first change it into character and then date
power$Date <- as.Date(as.character(power$Date), "%d/%m/%Y")
##Since | is not a viable expression in date vector, gotta seprarte into two parts to define the limit
pdata <- subset(power,Date >= "2007-02-01" & Date <= "2007-02-02")
##Again, since pdata$Global_active_power is of factor vector, gotta first convert it into character then numeric, in case of misvale
par(mfrow = c(1,1),mar = c(2,5,1,2))
hist(as.numeric(as.character(pdata$Global_active_power)),main = "Global Active Power",col = "red",xlab = "Global Active Power (kilowatts)")
dev.copy(png,file = "plot1.png")
dev.off()
