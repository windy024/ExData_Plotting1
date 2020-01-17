library(data.table)
library(lubridate)

data_set <- fread("household_power_consumption.txt",sep=";")
data_set$Date <- dmy(data_set$Date)
data_set$Global_active_power <- as.numeric(data_set$Global_active_power)
data_set1 <- data_set[Date == '2007-02-01'|Date =='2007-02-02']
png("Plot1.png",width = 480, height = 480)
hist(data_set1$Global_active_power, main = "Plot 1", xlab = "Global Active Power(kW)", ylab = "Frequency", col = "Red")
dev.off()
