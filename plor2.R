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



#Plot 2
windows(480,480)
plot(hhpcf$Global_active_power, type="l", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png") 
dev.off()
