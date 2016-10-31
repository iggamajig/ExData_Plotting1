##Read, convert to date, and subset data.
read<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings="?")
read$Date<-as.Date(read$Date,"%d/%m/%Y")
subset<-read[read$Date=="2007-02-01"|read$Date=="2007-02-02",]
##Convert Time to POSIXlt and merge with Date.
datetime<-as.POSIXlt(paste(subset$Date,subset$Time))
merged<-cbind(subset,datetime)
##Create chart.
plot(merged$datetime,merged$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
##Make png.
dev.copy(png,file="plot2")
dev.off()