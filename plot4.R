## Reading household_power_consumption csv file
datasetHPC <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                       nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
datasetHPC$Date <- as.Date(datasetHPC$Date, format="%d/%m/%Y")

##Extracting data only from Feb 2007
dsFeb2007 <- subset(datasetHPC, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
##Removing from memory full household_power_consumption csv file
rm(datasetHPC)

##Converting date/time
datetime <- paste(as.Date(dsFeb2007$Date), dsFeb2007$Time)
dsFeb2007$Datetime <- as.POSIXct(datetime)

##Building Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dsFeb2007, {
    plot(Global_active_power~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~Datetime, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="")
})

##Saving to plot4.png
dev.copy(png, file="plot4.png", height=480, width=480)

#close PNG device
dev.off()