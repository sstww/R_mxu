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

##generate plot1.
png("plot1.png") 
 hist(epc1$Global_active_power, col = "red",
                main = "Global Active Power",
                xlab = "Global Active Power (kilowattes)")
dev.off()


 

 
 
