## -----------------------------------------------------------------------------
## Author: Jake Ruttenberg
## Script: plot4.R
## -----------------------------------------------------------------------------

library(dplyr)

## Read power consumption data
household_power_consumptionDf <- read.table("./Electric Power Consumption/household_power_consumption.txt", sep=";"
                                            , header=TRUE, na.strings="?", stringsAsFactors=F)

## Filter for 2 dates
hpcDf<-filter(household_power_consumptionDf,Date %in% c("1/2/2007","2/2/2007"))

## Create a datetime field
hpcDf$datetime <- as.POSIXct(paste(hpcDf$Date, hpcDf$Time), format="%d/%m/%Y %H:%M:%S")

## Format the plot area
par(mfrow=c(2,2), mar=c(4,4,2,2), oma=c(0,0,2,0), cex=.53)

## Plot Global_active_power
plot(hpcDf$Global_active_power ~ hpcDf$datetime, type="s", xlab="", ylab="Global Active Power (kilowatts)")

## Plot Global_active_power
plot(hpcDf$Voltage ~ hpcDf$datetime, type="s", xlab="datetime", ylab="Voltage")

## Plot Global_active_power
plot(hpcDf$Sub_metering_1 ~ hpcDf$datetime, type="s", xlab="", ylab="Energy sub metering")
points(hpcDf$Sub_metering_2 ~ hpcDf$datetime, type="s", col="red")
points(hpcDf$Sub_metering_3 ~ hpcDf$datetime, type="s", col="blue")
legend("topright", col=c("black","red","blue"), lty=1, lwd=2
       , legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), text.width=60000)

## Plot Global_active_power
plot(hpcDf$Global_reactive_power ~ hpcDf$datetime, type="s", xlab="datetime", ylab="Global_reactive_power")

#### Save the histogram in png format ####
dev.copy(png, "plot4.png",height=480, width=480)
dev.off()