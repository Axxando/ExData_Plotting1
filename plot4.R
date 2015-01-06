## This is the R script for the Course Project 1 of
## Exploratory Data Analysis on Coursera, January 2015

# set my local path: setwd("C:\\Users\\Andreas\\Google Drive\\temp\\exdata\\courseproject1\\ExData_Plotting1")

#read data, but not more down than needed... 
#The limiting by nrows speeds the script up - this works only for a stable, 
#known source data set! I would not do this in a real world case ;)
data <- read.csv("../household_power_consumption.txt", header=T, sep=";", nrows = 69516,  na.strings = "?")

#convert Date and Time to a new column DateTime
x <- paste(data$Date, data$Time)
data$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

#extract the relevant rows
data <- data[data$DateTime>="2007-02-01 00:00:00",]

#add the abbreviated English weekdays as a new column
Sys.setlocale("LC_TIME", "English")
data$Weekday <- weekdays(data$DateTime, abbreviate=T)

#prepare plot
par(mfrow=c(2,2))
par(cex=0.6)
par(bg = "transparent")

#plot1
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#plot2
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

#plot3
plot(data$DateTime, data$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n") #draw empty canvas with good scales
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1         ", "Sub_metering_2         ", "Sub_metering_3         "), lty=1, bty="n", col=c("black", "red", "blue"))

#plot4
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png,"plot4.png",width=480,height=480)
dev.off()

#send feedback to user
print("successfully completed")