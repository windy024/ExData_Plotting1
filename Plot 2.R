library(data.table)
library(lubridate)

data_set <- fread("household_power_consumption.txt",sep=";")
data_set$Global_active_power <- as.numeric(data_set$Global_active_power)
data_set1 <- data_set[Date %in% c("1/2/2007","2/2/2007")]
data_set1$Date <- as.Date(data_set1$Date,"%d/%m/%Y")
date_time <- paste(as.Date(data_set1$Date),data_set1$Time)
data_set1$date_time <- as.POSIXct(date_time)
png("Plot2.png",width = 480, height = 480)
plot(data_set1$Global_active_power~data_set1$date_time, type = "l",ylab = "Global Active Power(kW)",xlab = "")
dev.off()
