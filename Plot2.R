dd <- read.table("household_power_consumption.txt", header = T, sep = ";", dec = ".", na.strings = c("?","NA"))
library(dplyr)
library(lubridate)
working_data = dd %>%
  filter(Date == "1/2/2007")%>%
  mutate(Date = lubridate::dmy(Date))


working_data = working_data %>%
  mutate(fulltime = paste(Date,Time, sep = " "))

working_data = working_data %>%
  mutate(day =  as.POSIXct(ymd_hms(as.character(fulltime))))

working_data <- working_data[,-11]
windows()
plot(working_data$day,working_data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
