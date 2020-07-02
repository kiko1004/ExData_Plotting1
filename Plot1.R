#Getting the data -----------
dd <- read.table("household_power_consumption.txt", header = T, sep = ";", dec = ".", na.strings = c("?","NA"))
library(dplyr)
library(lubridate)
working_data = dd %>%
  filter(Date == "1/2/2007")%>%
  mutate(Date = lubridate::dmy(Date))
  
#Plot 1 -------------
lapply(working_data, class)
windows()
hist(x = working_data$Global_active_power ,main="Global Active Power",
        xlab="Global Active Power (kw)", ylab = "Frequency", col = "red", breaks = 12)


