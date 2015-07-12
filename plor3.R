#Load Libraries
library("dplyr")


#read the data

hhpc<-read.table(".\\exdata-data-household_power_consumption\\household_power_consumption.txt",header = T, 
                 sep = ";",stringsAsFactors = F, na.strings = "?")

hhpcf<-filter(hhpc, Date=="1/2/2007"|Date=="2/2/2007")

hhpcf$datetime<-paste(hhpcf$Date,hhpcf$Time)
hhpcf$datetime2<-strptime(hhpcf$datetime, "%d/%m/%Y %H:%M:%S")
hhpcf$Date<-as.Date(hhpcf$datetime,"%d/%m/%Y")
hhpcf$Day<-wday(hhpcf$Date, label=TRUE)
hhpcf$Time<-strptime(hhpcf$Time, "%H:%M:%S")



#Plot 3
windows(480,480)
plot(hhpcf$Sub_metering_1, type="l", , xlab="", ylab="Energy Sub Metering")
lines(hhpcf$Sub_metering_2, type = "l",col = "red")
lines(hhpcf$Sub_metering_3, type = "l",col = "blue")
dev.copy(png, file = "plot3.png") 
dev.off()
