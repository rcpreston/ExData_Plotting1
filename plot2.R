pwrdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
pwrdata[ ,"Date"]<-as.Date(pwrdata[ ,"Date"],format='%d/%m/%Y')
pwrdata<-pwrdata[pwrdata[ ,"Date"]=="2007-02-01" | pwrdata[ ,"Date"]=="2007-02-02", ]
date<-c(pwrdata[ ,"Date"])
time<-c(pwrdata[ ,"Time"])
timedate=paste(date,time)
plot(as.POSIXlt(timedate),as.numeric(pwrdata[ ,"Global_active_power"]),ylab="Global Active Power (kilowatts)",main="",xlab="",type="l",cex.axis=.7,cex.lab=.7)

dev.copy(png,width=480,height=480,units="px",file="plot2.png")
dev.off()