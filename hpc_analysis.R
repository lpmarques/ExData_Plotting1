# dataframe reading
hpc <- read.delim("household_power_consumption.txt",head=T,sep=";")
hpc <- subset(hpc,as.character(Date)=="1/2/2007"|as.character(Date)=="2/2/2007") # selects data points from 2007-02-01 and 02

# class convertions
hpc$dateTime <- with(hpc,strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S")) # time and date to single POSIXct format
hpc <- as.data.frame(sapply(hpc[,3:dim(hpc)[2]],function(col){if(is.factor(col)){return(as.numeric(as.character(col)))}else{return(col)}})) # remaining variables from factor to numeric

# plot 1
hist(hpc$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.print(png,"plot1.png",width=480) # prints plot to png

# plot 2
with(hpc,plot(dateTime,Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="n"))
with(hpc,lines(dateTime,Global_active_power))
dev.print(png,"plot2.png",width=480) # prints plot to png

# plot 3
with(hpc,plot(dateTime,Sub_metering_1,ylab="Energy sub metering",xlab="",type="n"))
with(hpc,lines(dateTime,Sub_metering_1))
with(hpc,lines(dateTime,Sub_metering_2,col="red"))
with(hpc,lines(dateTime,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"))
dev.print(png,"plot3.png",width=480) # prints plot to png

# plot 4
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

dev.print(png,"plot4.png",width=480) # prints plot to png
