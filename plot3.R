pwrdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
pwrdata[ ,"Date"]<-as.Date(pwrdata[ ,"Date"],format='%d/%m/%Y')
pwrdata<-pwrdata[pwrdata[ ,"Date"]=="2007-02-01" | pwrdata[ ,"Date"]=="2007-02-02", ]

png(width=480,height=480,units="px",file="plot3.png")
date<-c(pwrdata[ ,"Date"])
time<-c(pwrdata[ ,"Time"])
timdat=as.POSIXlt(paste(date,time))
sub1<-as.numeric(pwrdata[ ,"Sub_metering_1"])
sub2<-as.numeric(pwrdata[ ,"Sub_metering_2"])
sub3<-as.numeric(pwrdata[ ,"Sub_metering_3"])
plot(timdat,sub1,type="l", xlab="",ylab="Energy sub metering",main="",col="black",cex.lab=.8,cex.axis=.8)
lines(timdat,sub2,col="red")
lines(timdat,sub3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=.8,col=c("black","red","blue"),lty=c(1,1,1))

dev.off()