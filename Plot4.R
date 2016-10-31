##Read, convert to date, and subset data.
read<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings="?")
read$Date<-as.Date(read$Date,"%d/%m/%Y")
subset<-read[read$Date=="2007-02-01"|read$Date=="2007-02-02",]
##Convert Time to POSIXlt and merge with Date.
datetime<-as.POSIXlt(paste(subset$Date,subset$Time))
merged<-cbind(subset,datetime)
##Create chart.
par(mfrow=c(2,2))
plot(merged$datetime,merged$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(merged$datetime,merged$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(merged$datetime,merged$Global_reactive_power,type="l",xlab="datetime",ylab="Voltage")
plot(merged$datetime,merged$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(merged$datetime,merged$Sub_metering_2,type="l",col="Red")
lines(merged$datetime,merged$Sub_metering_3,type="l",col="Blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,box.lty=0)
##Make png.
dev.copy(png,file="plot4")
dev.off()