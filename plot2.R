##Set working directory
work_dir="/Users/jenmollon/Dropbox/learning/exploratory_data_analysis/ExData_Plotting1/"
setwd(work_dir)

#This script will read in the required data 
options(stringsAsFactors=FALSE)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",dest="power.zip",method="curl")

#Unzip and read in the power data
power <- read.table(unz("power.zip", "household_power_consumption.txt"),sep=";",header=T,as.is=T)

#convert date 
power$date_time=strptime(paste(power$Date,power$Time),format="%d/%m/%Y %H:%M:%S")

#filter for 2 required dates
power1=power[as.Date(power$date_time) == as.Date('2007-02-01') | as.Date(power$date_time) == as.Date('2007-02-02'),]


png(paste(work_dir,"plot2.png",sep=""))
with(power1,plot(date_time,as.numeric(Global_active_power),ylab="Global Active Power (kilowatts)",type="l",xlab=""))
dev.off()
