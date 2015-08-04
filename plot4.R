
#read data
alldata=read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)

#add column for date and time
alldata$DateTime <- strptime(paste(alldata$Date, alldata$Time),
                             "%d/%m/%Y %H:%M:%S")
alldata$Date=as.Date(alldata$Date,format="%d/%m/%Y")

#subset selected days
data=subset(alldata,Date >="2007-02-01" & Date<="2007-02-02")

#format data
cols= c(3:9)
data[,cols] = apply(data[,cols], 2, function(x) as.numeric(x))

#plot
png(file="plot4.png",width=480, height=480)
par(mfcol=c(2,2))
with(data, {
      plot(data$DateTime, data$Global_active_power, type="l", xlab="", 
           ylab="Global Active Power (kilowatts)")
      plot(data$DateTime, data$Sub_metering_1, ylab="Energy sub metering",
           xlab="", type="l", col="black")
      lines(data$DateTime, data$Sub_metering_2, col="red")
      lines(data$DateTime, data$Sub_metering_3, col="blue")
      legend("topright", 
             legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
             col=c("black","red","blue"), lty=1)
      plot(data$DateTime, data$Voltage, type="l", xlab="datetime", 
           ylab="Voltage")
      plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime",
           ylab="Global_reactive_power")
})
dev.off()