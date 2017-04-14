##load packages
library(lubridate)
library(dplyr)

##import data 
power <- read.table("~/Downloads/household_power_consumption.txt", stringsAsFactors = FALSE, na.strings = "?", sep = ";", header = TRUE)
power <- tbl_df(power)

##convert Date to date format
power$Date <- dmy(power$Date)

#create vector to index and subset data
dates <- ymd(c("2007-02-01", "2007-02-02"))
pwrdates <- which(power$Date %in% dates)
tdp <- power[pwrdates, ]

##plot histogram
png("~/Coursera/plot1.png")
hist(tdp$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()


