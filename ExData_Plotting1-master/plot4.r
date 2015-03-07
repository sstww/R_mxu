##Electric power consumption
##epc.r

## Download the file from website
##setwd("~/GitHub/R_mxu/ExData_Plotting1-master")
##fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## download.file(fileURL, destfile="/power.zip")

## Unzip files from local directory

## unzip("./power.zip")
## To be sure that the files are at the good place
## list.files()
 
##read the file into r
 epc<-read.table("household_power_consumption.txt", header=TRUE, 
                 sep= ";",na.strings="?", 
                 stringsAsFactors=F)

##filter and format data for plotting
library (dplyr)
 epc1<-epc %>% filter(Date=="2/2/2007"| Date=="1/2/2007") 
 
library (lubridate) 
 epc1$Date<-dmy(epc1$Date)
 epc1$Time<-hms(epc1$Time)
 epc1$Day<-wday(epc1$Date, label=TRUE)
 epc1$DayTime<-epc1$Date+epc1$Time

##generate plot4.
png("plot4.png")       
par(mfrow=c(2, 2))
with(epc1, {
  plot(DayTime, Global_active_power, type="l",
       main = "",
       xlab="",
       ylab = "Global Active Power (kilowattes)"  )
  
  plot(DayTime, Voltage, 
       type="l",
       main = "",
       xlab="datetime",
       ylab = "Votage")
  
  plot (DayTime, Sub_metering_1,type="l", col="black", 
        main = "",
        xlab="",
        ylab = "Energy sub metering")
  lines(DayTime, Sub_metering_2,type="l", col="red")
  lines(DayTime, Sub_metering_3,type="l", col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col=c("black", "red", "blue"), bty="n", lwd=1)
  
  plot(DayTime, Global_reactive_power, type="l",
       main = "",
       xlab="datetime",
       ylab = "Global_reactive_Power"  )
})
dev.off()


 

 
 
