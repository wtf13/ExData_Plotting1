library(data.table)
dat<-fread("./household_power_consumption.txt")
dat<-dat[dat$Dat %in% c("1/2/2007","2/2/2007"),]

library(lubridate)
dat$DateTime<-dmy_hms(paste(dat$Date,dat$Time))
dat$Sub_metering_1<-as.numeric(dat$Sub_metering_1)
dat$Sub_metering_2<-as.numeric(dat$Sub_metering_2)
dat$Sub_metering_3<-as.numeric(dat$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(dat$DateTime,dat$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(dat$DateTime,dat$Sub_metering_2,col="red")
lines(dat$DateTime,dat$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1",
            "Sub_metering_2","Sub_metering_3"),cex=0.75)
dev.off()