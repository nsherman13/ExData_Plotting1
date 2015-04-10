full_file <- read.csv("household_power_consumption.txt",sep = ";",
                      colClasses = c("character","character","numeric","numeric","numeric","numeric",
                                     "numeric","numeric","numeric"),na.strings = "?")

#Subset Data to only what I want
clean_data <- subset(full_file,Date == "1/2/2007" | Date == "2/2/2007")
#Create DateTime column to be used for plot
clean_data$DateTime = paste(clean_data$Date,clean_data$Time)
clean_data$DateTime = strptime(clean_data$DateTime, "%d/%m/%Y %H:%M:%S")
#launch file device and plot
png(filename = "plot3.png",height = 480, width = 480)
plot(x= clean_data$DateTime,y = clean_data$Sub_metering_1,col = "black",type = "l",xlab = "",ylab = "Energy sub metering")
lines(x = clean_data$DateTime,y = clean_data$Sub_metering_2, col = "red")
lines(x = clean_data$DateTime,y = clean_data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty = 1, 
      col = c("black", "red","blue"))
#turn off png device
dev.off()