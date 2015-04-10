#Reads whole file 
full_file <- read.csv("household_power_consumption.txt",sep = ";",
                      colClasses = c("character","character","numeric","numeric","numeric","numeric",
                                     "numeric","numeric","numeric"),na.strings = "?")

#Subset Data to only what I want
clean_data <- subset(full_file,Date == "1/2/2007" | Date == "2/2/2007")
#Create DateTime column to be used for plot
clean_data$DateTime = paste(clean_data$Date,clean_data$Time)
clean_data$DateTime = strptime(clean_data$DateTime, "%d/%m/%Y %H:%M:%S")
#launch file device and create histogram in it
png(filename = "plot1.png",height = 480,width = 480)
hist(clean_data$Global_active_power,main = "Global Power",col = "red",xlab = "Global Active Power (kilowatts)")
#turn off file device
dev.off()