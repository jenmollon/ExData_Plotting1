#Set working directory
work_dir="/Users/jenmollon/Dropbox/learning/exploratory_data_analysis/ExData_Plotting1/"
setwd(work_dir)

#This script will read in the required data 
options(stringsAsFactors=FALSE)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",dest="power.zip",method="curl")

#Unzip and read in the power data
power <- read.table(unz("power.zip", "household_power_consumption.txt"),sep=";",header=T,as.is=T)

#convert date 
power$Date=as.Date(power$Date, '%d/%m/%Y')

#filter for 2 required dates
library(dplyr)
power1=filter(power, Date == as.Date('2007-02-01') | Date == as.Date('2007-02-01') )

png(paste(work_dir,"plot1.png",sep=""))
hist(as.numeric(power1$Global_active_power),main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
dev.off()