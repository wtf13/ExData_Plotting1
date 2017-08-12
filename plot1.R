library(data.table)
dat<-fread("./household_power_consumption.txt")
dat<-dat[dat$Dat %in% c("1/2/2007","2/2/2007"),]


dat$Global_active_power<-as.numeric(dat$Global_active_power)
png("plot1.png", width=480, height=480)
hist(dat$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",
     main="Global Active Power")
dev.off()
