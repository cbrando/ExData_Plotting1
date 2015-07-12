#Load Libraries
library("dplyr")


#read the data

hhpc<-read.table(".\\exdata-data-household_power_consumption\\household_power_consumption.txt",header = T, 
                 sep = ";",stringsAsFactors = F, na.strings = "?")

hhpcf<-filter(hhpc, Date=="1/2/2007"|Date=="2/2/2007")

hhpcf$Date<-as.Date(hhpcf$Date)
hhpcf$Time<-strptime(hhpcf$Time, "%H:%M:%S")

#Plot 1
windows(480,480)
hist(hhpcf$Global_active_power,col="Red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png") 
dev.off()
