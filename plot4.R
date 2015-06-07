## Loading the data for overall subsetting; required for ALL plots
Dataset <- read.table("household_power_consumption.txt",header=T,sep=";", stringsAsFactors=FALSE)

ActualData <- Dataset[Dataset$Date %in% c("1/2/2007","2/2/2007"),]
rm(Dataset)

ActualData$Time <- strptime(paste(ActualData$Date,ActualData$Time), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(ActualData$Global_active_power)
Voltage <- as.numeric(ActualData$Voltage)
Sub_metering_1 <- as.numeric(ActualData$Sub_metering_1)
Sub_metering_2 <- as.numeric(ActualData$Sub_metering_2)
Sub_metering_3 <- as.numeric(ActualData$Sub_metering_3)
GlobalReactivePower <- as.numeric(ActualData$Global_reactive_power)

png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))



## Creates plot on top left corner
plot(x=ActualData$Time,y=GlobalActivePower,type="l",xlab="",ylab="Global Active Power")

## Creates plot on top right corner
plot(x=ActualData$Time,y=Voltage,type="l",xlab="datetime",ylab="Voltage")


## Creates plot on bottom left corner

plot(x=ActualData$Time,y=Sub_metering_1,ylab="Energy sub metering",type="l",xlab="")
lines(x=ActualData$Time,y=Sub_metering_2,col="red")
lines(x=ActualData$Time,y=Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

## Creates plot on bottom right corner
plot(x=ActualData$Time,y=GlobalReactivePower,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()
