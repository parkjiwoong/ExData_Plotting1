## Loading the data for overall subsetting; required for ALL plots
Dataset <- read.table("household_power_consumption.txt",header=T,sep=";", stringsAsFactors=FALSE)

ActualData <- Dataset[Dataset$Date %in% c("1/2/2007","2/2/2007"),]
rm(Dataset)

## Plot 2 specific code

ActualData$Time <- strptime(paste(ActualData$Date,ActualData$Time), "%d/%m/%Y %H:%M:%S")
png("plot2.png",width=480,height=480)
GlobalActivePower <- as.numeric(ActualData$Global_active_power)
plot(x=ActualData$Time,y=GlobalActivePower,ylab="Global Active Power (kilowatts)",type="l",xlab="")
dev.off()
