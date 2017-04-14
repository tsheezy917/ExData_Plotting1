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

png("~/Coursera/plot4.png")
plot(Global_active_power ~ datehms, data = tdp2, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(Voltage ~ datehms, data = tdp2, type = "l", ylab = "Voltage", xlab = "datetime")
plot(Sub_metering_1 ~ datehms, data = tdp2, type = "l", ylab = "Energy Sub Metering", xlab = "")
points(Sub_metering_2 ~ datehms, data = tdp2, type = "l", col = "red")
points(Sub_metering_3 ~ datehms, data = tdp2, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))
plot(Global_reactive_power ~ datehms, data = tdp2, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()