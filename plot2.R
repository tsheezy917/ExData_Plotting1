##load packages
library(lubridate)
library(dplyr)

##import data 
power <- read.table("~/Downloads/household_power_consumption.txt", stringsAsFactors = FALSE, na.strings = "?", sep = ";", header = TRUE)
power <- tbl_df(power)

##convert to date format
power$Date <- dmy(power$Date)
power <- mutate(power, datehms = paste(power$Date, power$Time, sep = ""))
power$datehms <- ymd_hms(power$datehms)

#create vector to index and subset data
dates <- ymd(c("2007-02-01", "2007-02-02"))
pwrdates <- which(power$Date %in% dates)
tdp2 <- power[pwrdates, ]

##plot 
png("~/Coursera/plot2.png")
plot(Global_active_power ~ datehms, data = tdp2, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()