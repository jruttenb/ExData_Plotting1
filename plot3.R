## -----------------------------------------------------------------------------
## Author: Jake Ruttenberg
## Script: plot3.R
## -----------------------------------------------------------------------------

library(dplyr)

## Read power consumption data
household_power_consumptionDf <- read.table("./Electric Power Consumption/household_power_consumption.txt", sep=";"
                                            , header=TRUE, na.strings="?", stringsAsFactors=F)

## Filter for 2 dates
hpcDf<-filter(household_power_consumptionDf,Date %in% c("1/2/2007","2/2/2007"))

## Create a datetime field
hpcDf$datetime <- as.POSIXct(paste(hpcDf$Date, hpcDf$Time), format="%d/%m/%Y %H:%M:%S")

## Plot Global_active_power
plot(hpcDf$Sub_metering_1 ~ hpcDf$datetime, type="s", xlab="", ylab="Energy sub metering")
points(hpcDf$Sub_metering_2 ~ hpcDf$datetime, type="s", col="red")
points(hpcDf$Sub_metering_3 ~ hpcDf$datetime, type="s", col="blue")
legend("topright", col=c("black","red","blue"), lty=1, lwd=2
       , legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=.63, text.width=50000)

#### Save the histogram in png format ####
dev.copy(png, "plot3.png",height=480, width=480)
dev.off()