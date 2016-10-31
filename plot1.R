##Read, convert to date, and subset data.
read<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings="?")
read$Date<-as.Date(read$Date,"%d/%m/%Y")
subset<-read[read$Date=="2007-02-01"|read$Date=="2007-02-02",]
##Create chart.
hist(subset$Global_active_power,col="red",breaks=12,xlab="Global Active Power (kilowatts)",main="Global Active Power")
##Make png.
dev.copy(png,file="plot1")
dev.off()
