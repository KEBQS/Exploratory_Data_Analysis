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

##Building Plot 2
plot(dsFeb2007$Global_active_power~dsFeb2007$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

##Saving to plot2.png
dev.copy(png, file="plot2.png", height=480, width=480)

#close PNG device
dev.off()