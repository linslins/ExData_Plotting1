
#read data
alldata=read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)

#add column for date and time
alldata$DateTime <- strptime(paste(alldata$Date, alldata$Time),
                             "%d/%m/%Y %H:%M:%S")
alldata$Date=as.Date(alldata$Date,format="%d/%m/%Y")

#subset selected days
data=subset(alldata,Date >="2007-02-01" & Date<="2007-02-02")

#format power data
data$Global_active_power <- as.numeric(data$Global_active_power)

#plot to file
png(file="plot2.png",width=480, height=480)

plot(data$DateTime, data$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()
