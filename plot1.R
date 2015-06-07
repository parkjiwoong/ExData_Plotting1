## Loading the data for overall subsetting; required for ALL plots
Dataset <- read.table("household_power_consumption.txt",header=T,sep=";", stringsAsFactors=FALSE)

ActualData <- Dataset[Dataset$Date %in% c("1/2/2007","2/2/2007"),]
ActualData$Date <- as.Date(ActualData$Date,format="%d/%m/%Y")
rm(Dataset)

## Plot 1 specific code
png("plot1.png",width=480,height=480)
hist(as.numeric(ActualData$Global_active_power),col="red",main="Global Active Power",ylab="Frequency",xlab="Global Active Power (kilowatts)")
dev.off()
