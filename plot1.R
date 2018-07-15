#load data
setwd("~/Desktop/Coursera/Exploratory Analysis")
power <-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)

#convert date column to Date format
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

#filter df just for the 2 dates of interest
power1 <- subset(power, Date =="2007-02-01" | Date=="2007-02-02")

#transform column to numeric
power1$Global_active_power <- as.numeric(power1$Global_active_power)


#------------PLOT1----------------
par(mfrow=c(1,1))
hist(power1$Global_active_power, col="red", main="Global Active Power",breaks=16,
     xlab="Global Active Power (kilowatts)", ylab="Frequency",ylim=c(0,1200)) 

dev.copy(png,'plot1.png')
dev.off()