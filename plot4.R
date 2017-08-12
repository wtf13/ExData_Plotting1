library(data.table)
dat<-fread("./household_power_consumption.txt")
dat<-dat[dat$Dat %in% c("1/2/2007","2/2/2007"),]

library(lubridate)
dat$DateTime<-dmy_hms(paste(dat$Date,dat$Time))
dat$Sub_metering_1<-as.numeric(dat$Sub_metering_1)
dat$Sub_metering_2<-as.numeric(dat$Sub_metering_2)
dat$Sub_metering_3<-as.numeric(dat$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
dat$DateTime<-dmy_hms(paste(dat$Date,dat$Time))
dat$Global_active_power<-as.numeric(dat$Global_active_power)
dat$Voltage<-as.numeric(dat$Voltage)
dat$Global_reactive_power<-as.numeric(dat$Global_reactive_power)

plot(dat$DateTime,dat$Global_active_power,type="l",xlab="",
     ylab="Global Active Power")

plot(dat$DateTime,dat$Voltage,type="l",xlab="datetime",
     ylab="Voltage")

plot(dat$DateTime,dat$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(dat$DateTime,dat$Sub_metering_2,col="red")
lines(dat$DateTime,dat$Sub_metering_3,col="blue")
legend("topright",pch="-",col=c("black","red","blue"),legend=c("Sub_metering_1",
            "Sub_metering_2","Sub_metering_3"),bty="n",cex=0.75)
plot(dat$DateTime,dat$Global_reactive_power,type="l",xlab="datetime",
     ylab="Global_reactive_power")

dev.off()