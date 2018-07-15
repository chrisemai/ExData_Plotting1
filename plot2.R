#load data
setwd("~/Desktop/Coursera/Exploratory Analysis")
power <-read.table("household_power_consumption.txt", header=TRUE, sep=";")


#convert date column to Date format
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

#filter df just for the 2 dates of interest
power1 <- subset(power, Date =="2007-02-01" | Date=="2007-02-02")

#transform column to numeric
power1$Global_active_power <- as.numeric(power1$Global_active_power)/1000


#------------PLOT2----------------
#create new date time variable
power1$datetime<-as.POSIXct(paste(power1$Date, power1$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(1,1), mar=c(2,4,2,2))
plot(power1$datetime, power1$Global_active_power, ylab="Global Active Power (kilowatts)", 
     xlab="", type="l", pch=26) #pch=26 is a null symbol


##save the file 
dev.copy(png,'plot2.png')
dev.off()