#Set working directory
work_dir="/Users/jenmollon/Dropbox/learning/exploratory_data_analysis/ExData_Plotting1/"
setwd(work_dir)

#This script will read in the required data 
options(stringsAsFactors=FALSE)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",dest="power.zip",method="curl")

#Unzip and read in the power data
power <- read.table(unz("power.zip", "household_power_consumption.txt"),sep=";",header=T,as.is=T)

#convert date 
power$date_time=strptime(paste(power$Date,power$Time),format="%Y-%m-%d %H:%M:%S")

#filter for 2 required dates
power1=power[as.Date(power$date_time) == as.Date('2007-02-01') | as.Date(power$date_time) == as.Date('2007-02-02')]

png(paste(work_dir,"plot4.png",sep=""))
par(mfrow=c(2,2))
#First plot
with(power1,plot(date_time,as.numeric(Global_active_power),ylab="Global Active Power (kilowatts)",type="l",xlab=""))

#Second plot
with(power1,plot(date_time,as.numeric(Voltage),ylab="Voltage",type="l",xlab="datetime"))

#Third plot
with(power1,plot(date_time,as.numeric(power1$Sub_metering_1),ylab="Energy sub metering",type="n",xlab=""))
yrange=par("usr")[3:4]
par(new=TRUE)
with(power1,plot(date_time,as.numeric(power1$Sub_metering_1),ylab="",type="l",xlab="",axes=FALSE,col="black"))
par(new=TRUE)
with(power1,plot(date_time,as.numeric(power1$Sub_metering_2),ylab="",type="l",xlab="",axes=FALSE,col="red",ylim=yrange))
par(new=TRUE)
with(power1,plot(date_time,as.numeric(power1$Sub_metering_3),ylab="",type="l",xlab="",axes=FALSE,col="blue",ylim=yrange))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
#Fourth plot
with(power1,plot(date_time,as.numeric(Global_reactive_power),type="l",ylab="Global_reactive_power",xlab="datetime"))
dev.off()
