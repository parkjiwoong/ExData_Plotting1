## Loading the data for overall subsetting; required for ALL plots
Dataset <- read.table("household_power_consumption.txt",header=T,sep=";", stringsAsFactors=FALSE)

ActualData <- Dataset[Dataset$Date %in% c("1/2/2007","2/2/2007"),]
rm(Dataset)

## Plot 3 specific code

ActualData$Time <- strptime(paste(ActualData$Date,ActualData$Time), "%d/%m/%Y %H:%M:%S")
png("plot3.png",width=480,height=480)
Sub_metering_1 <- as.numeric(ActualData$Sub_metering_1)
Sub_metering_2 <- as.numeric(ActualData$Sub_metering_2)
Sub_metering_3 <- as.numeric(ActualData$Sub_metering_3)
plot(x=ActualData$Time,y=Sub_metering_1,ylab="Energy sub metering",type="l",xlab="")
lines(x=ActualData$Time,y=Sub_metering_2,col="red")
lines(x=ActualData$Time,y=Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()
