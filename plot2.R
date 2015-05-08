## -----------------------------------------------------------------------------
## Author: Jake Ruttenberg
## Script: plot2.R
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
plot(hpcDf$Global_active_power ~ hpcDf$datetime, type="s", xlab="", ylab="Global Active Power (kilowatts)")

#### Save the histogram in png format ####
dev.copy(png, "plot2.png",height=480, width=480)
dev.off()