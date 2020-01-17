library(data.table)
library(lubridate)

data_set <- fread("household_power_consumption.txt",sep=";")
data_set$Global_active_power <- as.numeric(data_set$Global_active_power)
data_set1 <- data_set[Date %in% c("1/2/2007","2/2/2007")]
data_set1$Date <- as.Date(data_set1$Date,"%d/%m/%Y")
date_time <- paste(as.Date(data_set1$Date),data_set1$Time)
data_set1$date_time <- as.POSIXct(date_time)
data_set1$Sub_metering_1 <- as.numeric(data_set1$Sub_metering_1)
data_set1$Sub_metering_2 <- as.numeric(data_set1$Sub_metering_2)
data_set1$Sub_metering_3 <- as.numeric(data_set1$Sub_metering_3)

png("Plot3.png",width = 480, height = 480)
plot(data_set1$Sub_metering_1~data_set1$date_time, type = "l",ylab = "Global Active Power(kW)",xlab = "")
lines(data_set1$Sub_metering_2~data_set1$date_time, col = "Red")
lines(data_set1$Sub_metering_3~data_set1$date_time, col = "Blue")
legend("topright",col = c("black","red","blue"),lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
