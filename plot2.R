library(data.table)
dat<-fread("./household_power_consumption.txt")
dat<-dat[dat$Dat %in% c("1/2/2007","2/2/2007"),]

library(lubridate)
dat$DateTime<-dmy_hms(paste(dat$Date,dat$Time))
dat$Global_active_power<-as.numeric(dat$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dat$DateTime,dat$Global_active_power,type="l",xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()