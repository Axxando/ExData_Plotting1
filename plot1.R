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

#prepare plot
par(mfrow=c(1,1))
par(cex=0.8)
par(bg = "transparent")

#plot
hist(data$Global_active_power, main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red") 
dev.copy(png,"plot1.png",width=480,height=480)
dev.off()

#send feedback to user
print("successfully completed")