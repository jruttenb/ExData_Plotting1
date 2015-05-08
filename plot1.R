## -----------------------------------------------------------------------------
## Author: Jake Ruttenberg
## Script: plot1.R
## -----------------------------------------------------------------------------

library(dplyr)

## Read power consumption data
household_power_consumptionDf <- read.table("./Electric Power Consumption/household_power_consumption.txt", sep=";"
                                            , header=TRUE, na.strings="?", stringsAsFactors=F)

## Filter for 2 dates
hpcDf<-filter(household_power_consumptionDf,Date %in% c("1/2/2007","2/2/2007"))

## Create histogram
hist(hpcDf$Global_active_power,main="Global Active Power", xlab= "Global Active Power (kilowatts)"
     ,ylab= "Frequency", col= "Red")

#### Save the histogram in png format ####
dev.copy(png, "plot1.png",height=480, width=480)
dev.off()