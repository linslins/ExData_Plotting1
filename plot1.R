
#read data
alldata=read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)

alldata$Date=as.Date(alldata$Date,format="%d/%m/%Y")

#subset selected days
data=subset(alldata,Date >="2007-02-01" & Date<="2007-02-02")

#build plot
data$Global_active_power <- as.numeric(data$Global_active_power)

hist(data$Global_active_power, xlab="Global Active Power (kilowatts)",
     main="Global Active Power", col="red")

#copy plot to file
dev.copy(png, file = "plot1.png")
dev.off()
