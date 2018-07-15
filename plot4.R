#load data
setwd("~/Desktop/Coursera/Exploratory Analysis")
power <-read.table("household_power_consumption.txt", header=TRUE, sep=";")



#convert date column to Date format
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

#filter df just for the 2 dates of interest
power1 <- subset(power, Date =="2007-02-01" | Date=="2007-02-02")

#transform column to numeric
power1$Global_active_power <- as.numeric(power1$Global_active_power)/1000


#------------PLOT4----------------
par(mfrow=c(2,2),mar = c(4,4,4,4)) #creates 2x2 matrix

#1
plot(power1$datetime, power1$Global_active_power, ylab="Global Active Power (kilowatts)", 
     xlab="", type="l", pch=26) 

#2
plot(power1$datetime, power1$Voltage, ylab="Voltage", 
     xlab="", type="l", pch=26) 

#3
plot(power1$datetime, power1$Sub_metering_1, ylab="Energy sub metering", 
     xlab="",type="l", col="black") #pch=26 is a null symbol
lines(power1$datetime, power1$Sub_metering_2, col="red")
lines(power1$datetime, power1$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), pch = "|", cex=0.4, bty='n')

#4
plot(power1$datetime, power1$Global_reactive_power, ylab="Global reactive power", 
     xlab="", type="l", pch=26) 


##save the file 
dev.copy(png,'plot4.png')
dev.off()