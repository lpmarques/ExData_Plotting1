
hpc <- read.delim("household_power_consumption.txt",head=T,sep=";")
hpc <- subset(hpc,as.character(Date)=="1/2/2007"|as.character(Date)=="2/2/2007")

hpc$dateTime <- with(hpc,strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))
#hpc <- subset(hpc[,3:dim(hpc)[2]],dateTime>as.POSIXct("2007-02-01")&dateTime<as.POSIXct("2007-02-03"))

hpc <- as.data.frame(sapply(hpc,function(col){if(is.factor(col)){return(as.numeric(as.character(col)))}else{return(col)}}))


hist(hpc$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png,"plot1.png")

with(hpc,plot(dateTime,Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="n"))
with(hpc,lines(dateTime,Global_active_power))
dev.copy(png,"plot2.png")

with(hpc,plot(dateTime,Sub_metering_1,ylab="Energy sub metering",xlab="",type="n"))
with(hpc,lines(dateTime,Sub_metering_1))
with(hpc,lines(dateTime,Sub_metering_2,col="red"))
with(hpc,lines(dateTime,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"))
dev.copy(png,"plot3.png")


par(mfcol=c(2,2))
with(hpc,plot(dateTime,Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="n"))
with(hpc,lines(dateTime,Global_active_power))

with(hpc,plot(dateTime,Sub_metering_1,ylab="Energy sub metering",xlab="",type="n"))
with(hpc,lines(dateTime,Sub_metering_1))
with(hpc,lines(dateTime,Sub_metering_2,col="red"))
with(hpc,lines(dateTime,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"),box.lty=0)

with(hpc,plot(dateTime,Voltage,xlab="",type="n"))
with(hpc,lines(dateTime,Voltage))

with(hpc,plot(dateTime,Global_reactive_power,ylab="Global Reactive Power (kilowatts)",xlab="",type="n"))
with(hpc,lines(dateTime,Global_reactive_power))

dev.copy(png,"plot4.png")