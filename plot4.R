pwrdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
pwrdata[ ,"Date"]<-as.Date(pwrdata[ ,"Date"],format='%d/%m/%Y')
pwrdata<-pwrdata[pwrdata[ ,"Date"]=="2007-02-01" | pwrdata[ ,"Date"]=="2007-02-02", ]

date<-c(pwrdata[ ,"Date"])
time<-c(pwrdata[ ,"Time"])
timdat=as.POSIXlt(paste(date,time))
sub1<-as.numeric(pwrdata[ ,"Sub_metering_1"])
sub2<-as.numeric(pwrdata[ ,"Sub_metering_2"])
sub3<-as.numeric(pwrdata[ ,"Sub_metering_3"])

png(width=480,height=480,units="px",file="plot4.png")

par(mfrow=c(2,2))
plot(timdat,as.numeric(pwrdata[ ,"Global_active_power"]),ylab="Global Active Power (kilowatts)",main="",xlab="",type="l", cex.axis=.7,cex.lab=.7)
plot(timdat,as.numeric(pwrdata[ ,"Voltage"]),ylab="Voltage",xlab="datetime",main="",type="l",cex.axis=.7,cex.lab=.7)

plot(timdat,sub1,type="l", xlab="",ylab="Energy sub metering",main="",col="black",cex.axis=.7,cex.lab=.7)
lines(timdat,sub2,col="red")
lines(timdat,sub3,col="blue")
legend(x=timdat[1360],y=39.2,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=.7,col=c("black","red","blue"),lty=c(1,1,1),box.lty="blank")

plot(timdat,as.numeric(pwrdata[ ,"Global_reactive_power"]),xlab="datetime",ylab="Global_reactive_power",main="",type="l",cex.axis=.7,cex.lab=.7)

dev.off()