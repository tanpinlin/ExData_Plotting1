library(dplyr)

data<-read.csv2("household_power_consumption.txt")
data <- data %>% 
  filter(Date=="1/2/2007" | Date=="2/2/2007") %>%
  mutate(datetime=strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S")) %>%
  mutate(across(Global_active_power:Sub_metering_3,as.numeric)) %>%
  select(Global_active_power:datetime)

png("plot4.png")
par(mfrow=c(2,2))

plot(data$datetime, data$Global_active_power, type = "l",ann=FALSE)
title(ylab="Gobal Active Power")

with(data,plot(datetime, Voltage, type = "l"))

plot(data$datetime, data$Sub_metering_1, type = "l",ann=FALSE)
lines(data$datetime, data$Sub_metering_2,col="red")
lines(data$datetime, data$Sub_metering_3,col="blue")
title(ylab="Energy sub metering")
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="n")

with(data,plot(datetime, Global_reactive_power, type = "l"))

dev.off()