## Reading household_power_consumption csv file
datasetHPC <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                     nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
datasetHPC$Date <- as.Date(datasetHPC$Date, format="%d/%m/%Y")

##Extracting data only from Feb 2007
dsFeb2007 <- subset(datasetHPC, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
##Removing from memory full household_power_consumption csv file
rm(datasetHPC)

##Converting date/time
dsFeb2007$Date <- as.Date(dsFeb2007$Date, format="%d/%m/%Y")
dsFeb2007$Time <- strptime(dsFeb2007$Time, "%H:%M:%S", tz = "")

##Building Plot 1
hist(dsFeb2007$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

##Saving to plot1.png
dev.copy(png, file="plot1.png", height=480, width=480)

#close PNG device
dev.off()
