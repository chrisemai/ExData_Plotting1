#load data
setwd("~/Desktop/Coursera/Exploratory Analysis")
power <-read.table("household_power_consumption.txt", header=TRUE, sep=";" , stringsAsFactors = FALSE)



#convert date column to Date format
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

#filter df just for the 2 dates of interest
power1 <- subset(power, Date =="2007-02-01" | Date=="2007-02-02")

#transform column to numeric
power1$Global_active_power <- as.numeric(power1$Global_active_power)
power1$Sub_metering_1 <- as.numeric(power1$Sub_metering_1)
power1$Sub_metering_2 <- as.numeric(power1$Sub_metering_2)
power1$Sub_metering_3 <- as.numeric(power1$Sub_metering_3)

#------------PLOT3----------------
#create new date time variable
power1$datetime<-as.POSIXct(paste(power1$Date, power1$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(1,1))
plot(power1$datetime, power1$Sub_metering_1, ylab="Energy sub metering", 
     xlab="",type="l", col="black") #pch=26 is a null symbol
lines(power1$datetime, power1$Sub_metering_2, col="red")
lines(power1$datetime, power1$Sub_metering_3, col="blue")

#add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), pch = "|")

##save the file 
dev.copy(png,'plot3.png')
dev.off()