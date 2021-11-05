library(dplyr)

data<-read.csv2("household_power_consumption.txt")
data <- data %>% 
  filter(Date=="1/2/2007" | Date=="2/2/2007") %>%
  mutate(datetime=strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S")) %>%
  mutate(across(Global_active_power:Sub_metering_3,as.numeric)) %>%
  select(Global_active_power:datetime)

png("plot2.png")
plot(data$datetime, data$Global_active_power, type = "l",ann=FALSE)
title(ylab="Gobal Active Power (kilowatts)")
dev.off()
