
#read data
alldata=read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)

#add column for date and time
alldata$DateTime <- strptime(paste(alldata$Date, alldata$Time),
                             "%d/%m/%Y %H:%M:%S")
alldata$Date=as.Date(alldata$Date,format="%d/%m/%Y")

#subset selected days
data=subset(alldata,Date >="2007-02-01" & Date<="2007-02-02")

#format data
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

#plot to file
png(file="plot3.png",width=480, height=480)

plot(data$DateTime, data$Sub_metering_1, ylab="Energy sub metering",
        xlab="", type="l", col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1)
dev.off()
