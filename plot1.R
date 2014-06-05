pwrdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
pwrdata[ ,"Date"]<-as.Date(pwrdata[ ,"Date"],format='%d/%m/%Y')
pwrdata<-pwrdata[pwrdata[ ,"Date"]=="2007-02-01" | pwrdata[ ,"Date"]=="2007-02-02", ]
png(width=480,height=480,units="px",file="plot1.png")
hist(as.numeric(pwrdata[ ,"Global_active_power"]),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power",cex.lab=.8,cex.axis=.8)


dev.off()